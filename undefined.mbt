///|
pub(all) struct Undefined {}

///|
pub impl Any for Undefined with __type__(_) {
  "Undefined"
}

///|
pub impl Any for Undefined with __data__(_) {
  let buf = @buffer.new()
  buf.write_string_utf16le("undefined")
  buf.contents()
}

///|
pub impl Any for Undefined with __str__(_) {
  "undefined"
}

///|
pub impl Any for Undefined with __add__(_, _) {
  @double.not_a_number
}

///|
pub impl Any for Undefined with __sub__(_, _) {
  @double.not_a_number
}

///|
pub impl Any for Undefined with __mul__(_, _) {
  @double.not_a_number
}

///|
pub impl Any for Undefined with __div__(_, _) {
  @double.not_a_number
}

///|
pub impl Any for Undefined with __eq__(_, other) {
  match other.__type__() {
    "Null" | "Undefined" => true
    _ => false
  }
}

///|
pub impl Any for Undefined with __bool__(_) {
  false
}

///|
pub impl Any for Undefined with __hash__(_) {
  0
}

///|
pub fn undef() -> Undefined {
  Undefined::{  }
}
