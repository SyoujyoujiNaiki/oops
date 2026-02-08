///|
pub(all) struct Null {}

///|
/// Implement Any trait for type Null.
pub impl Any for Null with __type__(_) {
  "Null"
}

///|
/// Implement Any trait for type Null.
/// Just write null here
pub impl Any for Null with __data__(_) {
  let buf = @buffer.new()
  buf.write_string_utf16le("null")
  buf.contents()
}

///|
pub impl Any for Null with __str__(_) {
  "null"
}

///|
pub impl Any for Null with __add__(self, other) {
  match other.__type__() {
    "Array" | "String" => (self.__str__() + other.__str__()) as &Any
    "Boolean" | "Number" =>
      other.__data__().unsafe_read_uint64_le(0).reinterpret_as_double()
    "Null" | "Undefined" => 0.0
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Null with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Null with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Null with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Null with __eq__(_, other) {
  match other.__type__() {
    "Null" | "Undefined" => true
    _ => false
  }
}

///|
pub impl Any for Null with __ge__(_, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" => 0.0 >= number(other)
    _ => false
  }
}

///|
pub impl Any for Null with __gt__(_, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" => 0.0 > number(other)
    _ => false
  }
}

///|
pub impl Any for Null with __le__(_, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" => 0.0 <= number(other)
    _ => false
  }
}

///|
pub impl Any for Null with __lt__(_, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" => 0.0 < number(other)
    _ => false
  }
}

///|
pub impl Any for Null with __bool__(_) {
  false
}

///|
pub impl Any for Null with __hash__(_) {
  0
}

///|
pub fn nul() -> Null {
  Null::{  }
}
