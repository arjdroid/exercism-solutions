import gleam/string
import gleam/result

pub fn message(log_line: String) -> String {
  string.trim(string.drop_start(string.crop(from: log_line, before: ":"),2))
}

pub fn log_level(log_line: String) -> String {
  // should never have to come down to this?
  //let level = result.unwrap((string.split_once(log_line,":")), "BRUH")
  let levelres = string.split_once(log_line,":")
  let leveltup = result.unwrap(levelres, #("BRUH0","BRUH1"))
  let level = leveltup.0
  // why would they not do double linked lists
  // all the std functions seem the same
  // I think I really do have to split
  // I'll probably see a better way from others
  string.trim(string.lowercase(
    string.drop_end(string.drop_start(level,1),1)
  ))
}

pub fn reformat(log_line: String) -> String {
  let msg = message(log_line)
  let lvl = log_level(log_line)
  msg <> " (" <> string.lowercase(lvl) <> ")"
}