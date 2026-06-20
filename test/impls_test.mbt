///|
type Any = &@oops.Any

///|
test "boolean" {
  let b = true
  println((b as Any) + '1')
  println((b as Any) - '1')
  println((b as Any) * '1')
  println((b as Any) / '0')
}
