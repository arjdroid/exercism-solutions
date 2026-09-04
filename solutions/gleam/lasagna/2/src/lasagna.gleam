pub fn expected_minutes_in_oven() -> Int {
  40
}

pub fn remaining_minutes_in_oven(mins: Int) -> Int {
  expected_minutes_in_oven() - mins
}

pub fn preparation_time_in_minutes(layers: Int) -> Int {
  2 * layers
}

pub fn total_time_in_minutes(layers: Int, mins: Int) -> Int {
  preparation_time_in_minutes(layers) + mins
}

pub fn alarm() -> String {
  "Ding!"
}
