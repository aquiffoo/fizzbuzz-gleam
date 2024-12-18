import gleam/http/response.{
  type Response,
  set_body,
  prepend_header
}
import gleam/http/request.{
  type Request,
  get_header
}
import gleam/int
import gleam/bytes_tree.{type BytesTree}
import fb.{fb_range}

pub fn fizzbuzz_service(request: Request(BitArray)) -> Response(BytesTree) {
  let stop =
    case get_header(request, "stop") {
      Ok(value) -> 
        case int.parse(value) {
          Ok(n) -> n
          Error(_) -> 100
        }
      Error(_) -> 100
    }
  let output = fb_range(1, stop)
  let body = bytes_tree.from_string(output)

  response.new(200)
  |> prepend_header("Content-Type", "text/plain")
  |> set_body(body)
}
