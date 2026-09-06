pub fn square_of_sum(n: Int) -> Int {
  // recursion? please let it be so!
  // no... that's inefficient. Gaussian sum formula it is
  // recalculating the sum twice for square doesn't feel efficient...
  {{{n+1}*{n}}/2}*{{{n+1}*{n}}/2}
}

pub fn sum_of_squares(n: Int) -> Int {
  // maybe recurse? that's the easy inefficient way prima facie
  // ∃ non-recursive algorithm or formula to do this?
  case n {
    1 -> 1
    _ -> n*n + sum_of_squares(n-1)
  }
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
