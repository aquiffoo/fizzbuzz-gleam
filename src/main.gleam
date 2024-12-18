import gleam/http/elli
import server.{fizzbuzz_service}

pub fn main() {
  elli.become(fizzbuzz_service, on_port: 6969)
}
