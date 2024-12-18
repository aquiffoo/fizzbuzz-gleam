import gleam/int
import gleam/list
import gleam/string

fn fb(n: Int) -> String {
  case n % 3, n % 5 {
    0,0 -> "FizzBuzz "
    0,_ -> "Fizz "
    _,0 -> "Buzz "
    _,_ -> int.to_string(n) <> " "
  }
}

pub fn fb_range(
    start: Int,
    stop: Int
) -> String {
  let _results = list.range(start, stop)
  |> list.map(fb)
  |> string.concat()
}
