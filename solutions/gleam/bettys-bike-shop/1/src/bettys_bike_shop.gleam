// TODO: import the `gleam/int` module
// TODO: import the `gleam/float` module
// TODO: import the `gleam/string` module
import gleam/int as i
import gleam/float as f
import gleam/string as s
import gleam/result as r

pub fn pence_to_pounds(pence: Int) -> Float {
  r.unwrap(f.divide(i.to_float(pence),i.to_float(100)),i.to_float(0))
}

pub fn pounds_to_string(pounds) -> String {
  s.append("£",f.to_string(pounds))
}
