import gleam/int
// there's got to be a better way

fn pling(n: Int) -> String {
  case n {
     i if i % 3 == 0 -> "Pling"
    _ -> ""
  }
}

fn plang(n: Int) -> String {
  case n {
     i if i % 5 == 0 -> "Plang"
    _ -> ""
  }
}

fn plong(n: Int) -> String {
  case n {
     i if i % 7 == 0 -> "Plong"
    _ -> ""
  }
}

pub fn convert(n: Int) -> String {
  case n {
     i if {i % 3 == 0}||{i % 5 == 0}||{i % 7 == 0} -> pling(n) <> plang(n) <> plong(n)
    _ -> int.to_string(n)
  }
}
