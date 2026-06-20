///|
pub impl Any for Bool with fn layer(self) {
  Boolean(self)
}

///|
pub impl Any for Byte with fn layer(self) {
  Scalar8(self)
}

///|
pub impl Any for Int16 with fn layer(self) {
  Scalar16(self)
}

///|
pub impl Any for Int with fn layer(self) {
  Scalar32(self)
}

///|
pub impl Any for Int64 with fn layer(self) {
  Scalar64(self)
}

///|
pub impl Any for Float with fn layer(self) {
  Number(self.to_double())
}

///|
pub impl Any for Double with fn layer(self) {
  Number(self)
}

///|
pub impl Any for Char with fn layer(self) {
  Chars(self.to_string())
}

///|
pub impl Any for String with fn layer(self) {
  Chars(self)
}

///|
pub impl Any for StringView with fn layer(self) {
  Chars(self.data())
}

///|
pub impl Any for Bytes with fn layer(self) {
  Data(self)
}

///|
pub impl Any for BytesView with fn layer(self) {
  Data(self.data())
}

///|
pub impl Any for Bool with fn __add__(self, other) {
  match other.layer() {
    Boolean(o) => (self.to_int() + o.to_int()) as &Any
    Scalar8(o) => {
      let s_i : Byte = if self { 1 } else { 0 }
      s_i + o
    }
    Scalar16(o) => self.to_int16() + o
    Scalar32(o) => self.to_int() + o
    Scalar64(o) => self.to_int64() + o
    Number(o) => self.to_int().to_double() + o
    Chars(o) => self.to_string() + o
    Data(o) => {
      let buf = @buffer.Buffer()
      buf.write_byte(if self { 1 } else { 0 })
      buf.write_bytes(o)
      buf.contents()
    }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Bool with fn __sub__(self, other) {
  match other.layer() {
    Boolean(o) => (self.to_int() - o.to_int()) as &Any
    Scalar8(o) => {
      let s_i : Byte = if self { 1 } else { 0 }
      s_i - o
    }
    Scalar16(o) => self.to_int16() - o
    Scalar32(o) => self.to_int() - o
    Scalar64(o) => self.to_int64() - o
    Number(o) => self.to_int().to_double() - o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self.to_int().to_double() - o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Bool with fn __mul__(self, other) {
  match other.layer() {
    Boolean(o) => (self.to_int() * o.to_int()) as &Any
    Scalar8(o) => {
      let s_i : Byte = if self { 1 } else { 0 }
      s_i * o
    }
    Scalar16(o) => self.to_int16() * o
    Scalar32(o) => self.to_int() * o
    Scalar64(o) => self.to_int64() * o
    Number(o) => self.to_int().to_double() * o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self.to_int().to_double() * o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Bool with fn __div__(self, other) {
  match other.layer() {
    Boolean(o) => (self.to_int() / o.to_int()) as &Any
    Scalar8(o) => {
      let s_i : Byte = if self { 1 } else { 0 }
      s_i / o
    }
    Scalar16(o) => self.to_int16() / o
    Scalar32(o) => self.to_int() / o
    Scalar64(o) => self.to_int64() / o
    Number(o) => self.to_int().to_double() / o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self.to_int().to_double() / o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Bool with fn __mod__(self, other) {
  match other.layer() {
    Boolean(o) => (self.to_int() % o.to_int()) as &Any
    Scalar8(o) => {
      let s_i : Byte = if self { 1 } else { 0 }
      s_i % o
    }
    Scalar16(o) => self.to_int16() % o
    Scalar32(o) => self.to_int() % o
    Scalar64(o) => self.to_int64() % o
    Number(o) => self.to_int().to_double() % o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self.to_int().to_double() % o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Bool with fn __eq__(self, other) {
  match other.layer() {
    Boolean(o) => self.to_int() == o.to_int()
    Scalar8(o) => {
      let s_i : Byte = if self { 1 } else { 0 }
      s_i == o
    }
    Scalar16(o) => self.to_int16() == o
    Scalar32(o) => self.to_int() == o
    Scalar64(o) => self.to_int64() == o
    Number(o) => self.to_int().to_double() == o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_int().to_double() == o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Bool with fn __compare__(self, other) {
  match other.layer() {
    Boolean(o) => self.compare(o)
    Scalar8(o) => {
      let s_i : Byte = if self { 1 } else { 0 }
      s_i.compare(o)
    }
    Scalar16(o) => self.to_int16().compare(o)
    Scalar32(o) => self.to_int().compare(o)
    Scalar64(o) => self.to_int64().compare(o)
    Number(o) => self.to_int().to_double().compare(o)
    _ => raise NoImpl
  }
}

///|
pub impl Any for Bool with fn __ge__(self, other) {
  match other.layer() {
    Boolean(o) => self >= o
    Scalar8(o) => {
      let s_i : Byte = if self { 1 } else { 0 }
      s_i >= o
    }
    Scalar16(o) => self.to_int16() >= o
    Scalar32(o) => self.to_int() >= o
    Scalar64(o) => self.to_int64() >= o
    Number(o) => self.to_int().to_double() >= o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_int().to_double() >= o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Bool with fn __gt__(self, other) {
  match other.layer() {
    Boolean(o) => self > o
    Scalar8(o) => {
      let s_i : Byte = if self { 1 } else { 0 }
      s_i > o
    }
    Scalar16(o) => self.to_int16() > o
    Scalar32(o) => self.to_int() > o
    Scalar64(o) => self.to_int64() > o
    Number(o) => self.to_int().to_double() > o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_int().to_double() > o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Bool with fn __le__(self, other) {
  match other.layer() {
    Boolean(o) => self <= o
    Scalar8(o) => {
      let s_i : Byte = if self { 1 } else { 0 }
      s_i <= o
    }
    Scalar16(o) => self.to_int16() <= o
    Scalar32(o) => self.to_int() <= o
    Scalar64(o) => self.to_int64() <= o
    Number(o) => self.to_int().to_double() <= o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_int().to_double() <= o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Bool with fn __lt__(self, other) {
  match other.layer() {
    Boolean(o) => self < o
    Scalar8(o) => {
      let s_i : Byte = if self { 1 } else { 0 }
      s_i < o
    }
    Scalar16(o) => self.to_int16() < o
    Scalar32(o) => self.to_int() < o
    Scalar64(o) => self.to_int64() < o
    Number(o) => self.to_int().to_double() < o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_int().to_double() < o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Bool with fn __neg__(self) {
  if self {
    -1
  } else {
    -0
  }
}
