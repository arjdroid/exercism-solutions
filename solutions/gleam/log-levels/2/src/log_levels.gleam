import gleam/string

pub fn message(log_line: String) -> String {
  string.trim(string.drop_start(string.crop(from: log_line, before: ":"),2))
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[INFO]" <> asdf -> "info"
    "[WARNING]" <> asdf -> "warning"
    _ -> "error"
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}