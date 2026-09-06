pub fn square_of_sum(n: Int) -> Int {
  // well, there's no more authoritative solution than lpil's...
  // and this mitigates the redundant `add`, `mul` and `div` ops
  let sum = n * {n+1} / 2
  sum * sum
}

pub fn sum_of_squares(n: Int) -> Int {
  // ∃ non-recursive algorithm or formula to do this? yes.
  n * {n+1} * {2*n + 1} / 6
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
