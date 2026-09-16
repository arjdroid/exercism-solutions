import gleam/bool
import gleam/int

pub fn convert(n: Int) -> String {
  let res = ""
  let res = bool.guard(n % 3 == 0, res <> "Pling", fn() { res })
  let res = bool.guard(n % 5 == 0, res <> "Plang", fn() { res })
  let res = bool.guard(n % 7 == 0, res <> "Plong", fn() { res })
  case res {
    "" -> int.to_string(n)
    _ -> res
  }
}
