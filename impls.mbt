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
pub impl Any for BigInt with fn layer(self) {
  Integer(self)
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

///|
pub impl Any for Bool with fn __repr__(self) {
  if self {
    "true"
  } else {
    "false"
  }
}

///|
pub impl Any for Byte with fn __add__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_b : Byte = if o { 1 } else { 0 }
      (self + o_b) as &Any
    }
    Scalar8(o) => self + o
    Scalar16(o) => Int16::from_byte(self) + o
    Scalar32(o) => self.to_int() + o
    Scalar64(o) => self.to_int64() + o
    Number(o) => self.to_int().to_double() + o
    Chars(o) => self.to_string() + o
    Data(o) => {
      let buf = @buffer.Buffer()
      buf.write_byte(self)
      buf.write_bytes(o)
      buf.contents()
    }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Byte with fn __sub__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_b : Byte = if o { 1 } else { 0 }
      (self - o_b) as &Any
    }
    Scalar8(o) => self - o
    Scalar16(o) => Int16::from_byte(self) - o
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
pub impl Any for Byte with fn __mul__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_b : Byte = if o { 1 } else { 0 }
      (self * o_b) as &Any
    }
    Scalar8(o) => self * o
    Scalar16(o) => Int16::from_byte(self) * o
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
pub impl Any for Byte with fn __div__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_b : Byte = if o { 1 } else { 0 }
      (self / o_b) as &Any
    }
    Scalar8(o) => self / o
    Scalar16(o) => Int16::from_byte(self) / o
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
pub impl Any for Byte with fn __mod__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_b : Byte = if o { 1 } else { 0 }
      (self % o_b) as &Any
    }
    Scalar8(o) => self % o
    Scalar16(o) => Int16::from_byte(self) % o
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
pub impl Any for Byte with fn __eq__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_b : Byte = if o { 1 } else { 0 }
      self == o_b
    }
    Scalar8(o) => self == o
    Scalar16(o) => Int16::from_byte(self) == o
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
pub impl Any for Byte with fn __compare__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_b : Byte = if o { 1 } else { 0 }
      self.compare(o_b)
    }
    Scalar8(o) => self.compare(o)
    Scalar16(o) => Int16::from_byte(self).compare(o)
    Scalar32(o) => self.to_int().compare(o)
    Scalar64(o) => self.to_int64().compare(o)
    Number(o) => self.to_int().to_double().compare(o)
    _ => raise NoImpl
  }
}

///|
pub impl Any for Byte with fn __ge__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_b : Byte = if o { 1 } else { 0 }
      self >= o_b
    }
    Scalar8(o) => self >= o
    Scalar16(o) => Int16::from_byte(self) >= o
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
pub impl Any for Byte with fn __gt__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_b : Byte = if o { 1 } else { 0 }
      self > o_b
    }
    Scalar8(o) => self > o
    Scalar16(o) => Int16::from_byte(self) > o
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
pub impl Any for Byte with fn __le__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_b : Byte = if o { 1 } else { 0 }
      self <= o_b
    }
    Scalar8(o) => self <= o
    Scalar16(o) => Int16::from_byte(self) <= o
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
pub impl Any for Byte with fn __lt__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_b : Byte = if o { 1 } else { 0 }
      self < o_b
    }
    Scalar8(o) => self < o
    Scalar16(o) => Int16::from_byte(self) < o
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
pub impl Any for Byte with fn __neg__(self) {
  -self.to_int()
}

///|
pub impl Any for Byte with fn __repr__(self) {
  self.to_string()
}

///|
pub impl Any for Int16 with fn __add__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int16 = if o { 1 } else { 0 }
      (self + o_i) as &Any
    }
    Scalar8(o) => self + Int16::from_byte(o)
    Scalar16(o) => self + o
    Scalar32(o) => self.to_int() + o
    Scalar64(o) => self.to_int64() + o
    Number(o) => self.to_int().to_double() + o
    Chars(o) => self.to_string() + o
    Data(o) => {
      let buf = @buffer.Buffer()
      buf.write_int16_le(self)
      buf.write_bytes(o)
      buf.contents()
    }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int16 with fn __sub__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int16 = if o { 1 } else { 0 }
      (self - o_i) as &Any
    }
    Scalar8(o) => self - Int16::from_byte(o)
    Scalar16(o) => self - o
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
pub impl Any for Int16 with fn __mul__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int16 = if o { 1 } else { 0 }
      (self * o_i) as &Any
    }
    Scalar8(o) => self * Int16::from_byte(o)
    Scalar16(o) => self * o
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
pub impl Any for Int16 with fn __div__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int16 = if o { 1 } else { 0 }
      (self / o_i) as &Any
    }
    Scalar8(o) => self / Int16::from_byte(o)
    Scalar16(o) => self / o
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
pub impl Any for Int16 with fn __mod__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int16 = if o { 1 } else { 0 }
      (self % o_i) as &Any
    }
    Scalar8(o) => self % Int16::from_byte(o)
    Scalar16(o) => self % o
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
pub impl Any for Int16 with fn __eq__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int16 = if o { 1 } else { 0 }
      self == o_i
    }
    Scalar8(o) => self == Int16::from_byte(o)
    Scalar16(o) => self == o
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
pub impl Any for Int16 with fn __compare__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int16 = if o { 1 } else { 0 }
      self.compare(o_i)
    }
    Scalar8(o) => self.compare(Int16::from_byte(o))
    Scalar16(o) => self.compare(o)
    Scalar32(o) => self.to_int().compare(o)
    Scalar64(o) => self.to_int64().compare(o)
    Number(o) => self.to_int().to_double().compare(o)
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int16 with fn __ge__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int16 = if o { 1 } else { 0 }
      self >= o_i
    }
    Scalar8(o) => self >= Int16::from_byte(o)
    Scalar16(o) => self >= o
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
pub impl Any for Int16 with fn __gt__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int16 = if o { 1 } else { 0 }
      self > o_i
    }
    Scalar8(o) => self > Int16::from_byte(o)
    Scalar16(o) => self > o
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
pub impl Any for Int16 with fn __le__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int16 = if o { 1 } else { 0 }
      self <= o_i
    }
    Scalar8(o) => self <= Int16::from_byte(o)
    Scalar16(o) => self <= o
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
pub impl Any for Int16 with fn __lt__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int16 = if o { 1 } else { 0 }
      self < o_i
    }
    Scalar8(o) => self < Int16::from_byte(o)
    Scalar16(o) => self < o
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
pub impl Any for Int16 with fn __neg__(self) {
  -self
}

///|
pub impl Any for Int16 with fn __repr__(self) {
  self.to_string()
}

///|
pub impl Any for Int with fn __add__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int = if o { 1 } else { 0 }
      (self + o_i) as &Any
    }
    Scalar8(o) => self + o.to_int()
    Scalar16(o) => self + o.to_int()
    Scalar32(o) => self + o
    Scalar64(o) => self.to_int64() + o
    Number(o) => self.to_double() + o
    Chars(o) => self.to_string() + o
    Data(o) => {
      let buf = @buffer.Buffer()
      buf.write_int_le(self)
      buf.write_bytes(o)
      buf.contents()
    }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int with fn __sub__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int = if o { 1 } else { 0 }
      (self - o_i) as &Any
    }
    Scalar8(o) => self - o.to_int()
    Scalar16(o) => self - o.to_int()
    Scalar32(o) => self - o
    Scalar64(o) => self.to_int64() - o
    Number(o) => self.to_double() - o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self.to_double() - o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int with fn __mul__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int = if o { 1 } else { 0 }
      (self * o_i) as &Any
    }
    Scalar8(o) => self * o.to_int()
    Scalar16(o) => self * o.to_int()
    Scalar32(o) => self * o
    Scalar64(o) => self.to_int64() * o
    Number(o) => self.to_double() * o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self.to_double() * o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int with fn __div__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int = if o { 1 } else { 0 }
      (self / o_i) as &Any
    }
    Scalar8(o) => self / o.to_int()
    Scalar16(o) => self / o.to_int()
    Scalar32(o) => self / o
    Scalar64(o) => self.to_int64() / o
    Number(o) => self.to_double() / o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self.to_double() / o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int with fn __mod__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int = if o { 1 } else { 0 }
      (self % o_i) as &Any
    }
    Scalar8(o) => self % o.to_int()
    Scalar16(o) => self % o.to_int()
    Scalar32(o) => self % o
    Scalar64(o) => self.to_int64() % o
    Number(o) => self.to_double() % o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self.to_double() % o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int with fn __eq__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int = if o { 1 } else { 0 }
      self == o_i
    }
    Scalar8(o) => self == o.to_int()
    Scalar16(o) => self == o.to_int()
    Scalar32(o) => self == o
    Scalar64(o) => self.to_int64() == o
    Number(o) => self.to_double() == o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_double() == o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int with fn __compare__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int = if o { 1 } else { 0 }
      self.compare(o_i)
    }
    Scalar8(o) => self.compare(o.to_int())
    Scalar16(o) => self.compare(o.to_int())
    Scalar32(o) => self.compare(o)
    Scalar64(o) => self.to_int64().compare(o)
    Number(o) => self.to_double().compare(o)
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int with fn __ge__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int = if o { 1 } else { 0 }
      self >= o_i
    }
    Scalar8(o) => self >= o.to_int()
    Scalar16(o) => self >= o.to_int()
    Scalar32(o) => self >= o
    Scalar64(o) => self.to_int64() >= o
    Number(o) => self.to_double() >= o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_double() >= o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int with fn __gt__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int = if o { 1 } else { 0 }
      self > o_i
    }
    Scalar8(o) => self > o.to_int()
    Scalar16(o) => self > o.to_int()
    Scalar32(o) => self > o
    Scalar64(o) => self.to_int64() > o
    Number(o) => self.to_double() > o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_double() > o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int with fn __le__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int = if o { 1 } else { 0 }
      self <= o_i
    }
    Scalar8(o) => self <= o.to_int()
    Scalar16(o) => self <= o.to_int()
    Scalar32(o) => self <= o
    Scalar64(o) => self.to_int64() <= o
    Number(o) => self.to_double() <= o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_double() <= o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int with fn __lt__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int = if o { 1 } else { 0 }
      self < o_i
    }
    Scalar8(o) => self < o.to_int()
    Scalar16(o) => self < o.to_int()
    Scalar32(o) => self < o
    Scalar64(o) => self.to_int64() < o
    Number(o) => self.to_double() < o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_double() < o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int with fn __neg__(self) {
  -self
}

///|
pub impl Any for Int with fn __repr__(self) {
  self.to_string()
}

///|
pub impl Any for Int64 with fn __add__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int64 = if o { 1 } else { 0 }
      (self + o_i) as &Any
    }
    Scalar8(o) => self + o.to_int64()
    Scalar16(o) => self + o.to_int64()
    Scalar32(o) => self + o.to_int64()
    Scalar64(o) => self + o
    Number(o) => self.to_double() + o
    Chars(o) => self.to_string() + o
    Data(o) => {
      let buf = @buffer.Buffer()
      buf.write_int64_le(self)
      buf.write_bytes(o)
      buf.contents()
    }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int64 with fn __sub__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int64 = if o { 1 } else { 0 }
      (self - o_i) as &Any
    }
    Scalar8(o) => self - o.to_int64()
    Scalar16(o) => self - o.to_int64()
    Scalar32(o) => self - o.to_int64()
    Scalar64(o) => self - o
    Number(o) => self.to_double() - o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self.to_double() - o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int64 with fn __mul__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int64 = if o { 1 } else { 0 }
      (self * o_i) as &Any
    }
    Scalar8(o) => self * o.to_int64()
    Scalar16(o) => self * o.to_int64()
    Scalar32(o) => self * o.to_int64()
    Scalar64(o) => self * o
    Number(o) => self.to_double() * o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self.to_double() * o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int64 with fn __div__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int64 = if o { 1 } else { 0 }
      (self / o_i) as &Any
    }
    Scalar8(o) => self / o.to_int64()
    Scalar16(o) => self / o.to_int64()
    Scalar32(o) => self / o.to_int64()
    Scalar64(o) => self / o
    Number(o) => self.to_double() / o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self.to_double() / o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int64 with fn __mod__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int64 = if o { 1 } else { 0 }
      (self % o_i) as &Any
    }
    Scalar8(o) => self % o.to_int64()
    Scalar16(o) => self % o.to_int64()
    Scalar32(o) => self % o.to_int64()
    Scalar64(o) => self % o
    Number(o) => self.to_double() % o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self.to_double() % o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int64 with fn __eq__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int64 = if o { 1 } else { 0 }
      self == o_i
    }
    Scalar8(o) => self == o.to_int64()
    Scalar16(o) => self == o.to_int64()
    Scalar32(o) => self == o.to_int64()
    Scalar64(o) => self == o
    Number(o) => self.to_double() == o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_double() == o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int64 with fn __compare__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int64 = if o { 1 } else { 0 }
      self.compare(o_i)
    }
    Scalar8(o) => self.compare(o.to_int64())
    Scalar16(o) => self.compare(o.to_int64())
    Scalar32(o) => self.compare(o.to_int64())
    Scalar64(o) => self.compare(o)
    Number(o) => self.to_double().compare(o)
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int64 with fn __ge__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int64 = if o { 1 } else { 0 }
      self >= o_i
    }
    Scalar8(o) => self >= o.to_int64()
    Scalar16(o) => self >= o.to_int64()
    Scalar32(o) => self >= o.to_int64()
    Scalar64(o) => self >= o
    Number(o) => self.to_double() >= o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_double() >= o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int64 with fn __gt__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int64 = if o { 1 } else { 0 }
      self > o_i
    }
    Scalar8(o) => self > o.to_int64()
    Scalar16(o) => self > o.to_int64()
    Scalar32(o) => self > o.to_int64()
    Scalar64(o) => self > o
    Number(o) => self.to_double() > o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_double() > o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int64 with fn __le__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int64 = if o { 1 } else { 0 }
      self <= o_i
    }
    Scalar8(o) => self <= o.to_int64()
    Scalar16(o) => self <= o.to_int64()
    Scalar32(o) => self <= o.to_int64()
    Scalar64(o) => self <= o
    Number(o) => self.to_double() <= o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_double() <= o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int64 with fn __lt__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_i : Int64 = if o { 1 } else { 0 }
      self < o_i
    }
    Scalar8(o) => self < o.to_int64()
    Scalar16(o) => self < o.to_int64()
    Scalar32(o) => self < o.to_int64()
    Scalar64(o) => self < o
    Number(o) => self.to_double() < o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_double() < o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Int64 with fn __neg__(self) {
  -self
}

///|
pub impl Any for Int64 with fn __repr__(self) {
  self.to_string()
}

///|
pub impl Any for Double with fn __add__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_d : Double = if o { 1.0 } else { 0.0 }
      (self + o_d) as &Any
    }
    Scalar8(o) => self + o.to_int().to_double()
    Scalar16(o) => self + o.to_int().to_double()
    Scalar32(o) => self + o.to_double()
    Scalar64(o) => self + o.to_double()
    Number(o) => self + o
    Chars(o) => self.to_string() + o
    _ => raise NoImpl
  }
}

///|
pub impl Any for Double with fn __sub__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_d : Double = if o { 1.0 } else { 0.0 }
      (self - o_d) as &Any
    }
    Scalar8(o) => self - o.to_int().to_double()
    Scalar16(o) => self - o.to_int().to_double()
    Scalar32(o) => self - o.to_double()
    Scalar64(o) => self - o.to_double()
    Number(o) => self - o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self - o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Double with fn __mul__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_d : Double = if o { 1.0 } else { 0.0 }
      (self * o_d) as &Any
    }
    Scalar8(o) => self * o.to_int().to_double()
    Scalar16(o) => self * o.to_int().to_double()
    Scalar32(o) => self * o.to_double()
    Scalar64(o) => self * o.to_double()
    Number(o) => self * o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self * o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Double with fn __div__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_d : Double = if o { 1.0 } else { 0.0 }
      (self / o_d) as &Any
    }
    Scalar8(o) => self / o.to_int().to_double()
    Scalar16(o) => self / o.to_int().to_double()
    Scalar32(o) => self / o.to_double()
    Scalar64(o) => self / o.to_double()
    Number(o) => self / o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self / o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Double with fn __mod__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_d : Double = if o { 1.0 } else { 0.0 }
      (self % o_d) as &Any
    }
    Scalar8(o) => self % o.to_int().to_double()
    Scalar16(o) => self % o.to_int().to_double()
    Scalar32(o) => self % o.to_double()
    Scalar64(o) => self % o.to_double()
    Number(o) => self % o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self % o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Double with fn __eq__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_d : Double = if o { 1.0 } else { 0.0 }
      self == o_d
    }
    Scalar8(o) => self == o.to_int().to_double()
    Scalar16(o) => self == o.to_int().to_double()
    Scalar32(o) => self == o.to_double()
    Scalar64(o) => self == o.to_double()
    Number(o) => self == o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self == o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Double with fn __compare__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_d : Double = if o { 1.0 } else { 0.0 }
      self.compare(o_d)
    }
    Scalar8(o) => self.compare(o.to_int().to_double())
    Scalar16(o) => self.compare(o.to_int().to_double())
    Scalar32(o) => self.compare(o.to_double())
    Scalar64(o) => self.compare(o.to_double())
    Number(o) => self.compare(o)
    _ => raise NoImpl
  }
}

///|
pub impl Any for Double with fn __ge__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_d : Double = if o { 1.0 } else { 0.0 }
      self >= o_d
    }
    Scalar8(o) => self >= o.to_int().to_double()
    Scalar16(o) => self >= o.to_int().to_double()
    Scalar32(o) => self >= o.to_double()
    Scalar64(o) => self >= o.to_double()
    Number(o) => self >= o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self >= o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Double with fn __gt__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_d : Double = if o { 1.0 } else { 0.0 }
      self > o_d
    }
    Scalar8(o) => self > o.to_int().to_double()
    Scalar16(o) => self > o.to_int().to_double()
    Scalar32(o) => self > o.to_double()
    Scalar64(o) => self > o.to_double()
    Number(o) => self > o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self > o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Double with fn __le__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_d : Double = if o { 1.0 } else { 0.0 }
      self <= o_d
    }
    Scalar8(o) => self <= o.to_int().to_double()
    Scalar16(o) => self <= o.to_int().to_double()
    Scalar32(o) => self <= o.to_double()
    Scalar64(o) => self <= o.to_double()
    Number(o) => self <= o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self <= o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Double with fn __lt__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_d : Double = if o { 1.0 } else { 0.0 }
      self < o_d
    }
    Scalar8(o) => self < o.to_int().to_double()
    Scalar16(o) => self < o.to_int().to_double()
    Scalar32(o) => self < o.to_double()
    Scalar64(o) => self < o.to_double()
    Number(o) => self < o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self < o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Double with fn __neg__(self) {
  -self
}

///|
pub impl Any for Double with fn __repr__(self) {
  self.to_string()
}

///|
pub impl Any for Float with fn __add__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_f : Double = if o { 1.0 } else { 0.0 }
      (self.to_double() + o_f) as &Any
    }
    Scalar8(o) => self.to_double() + o.to_int().to_double()
    Scalar16(o) => self.to_double() + o.to_int().to_double()
    Scalar32(o) => self.to_double() + o.to_double()
    Scalar64(o) => self.to_double() + o.to_double()
    Number(o) => self.to_double() + o
    Chars(o) => self.to_string() + o
    _ => raise NoImpl
  }
}

///|
pub impl Any for Float with fn __sub__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_f : Double = if o { 1.0 } else { 0.0 }
      (self.to_double() - o_f) as &Any
    }
    Scalar8(o) => self.to_double() - o.to_int().to_double()
    Scalar16(o) => self.to_double() - o.to_int().to_double()
    Scalar32(o) => self.to_double() - o.to_double()
    Scalar64(o) => self.to_double() - o.to_double()
    Number(o) => self.to_double() - o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self.to_double() - o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Float with fn __mul__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_f : Double = if o { 1.0 } else { 0.0 }
      (self.to_double() * o_f) as &Any
    }
    Scalar8(o) => self.to_double() * o.to_int().to_double()
    Scalar16(o) => self.to_double() * o.to_int().to_double()
    Scalar32(o) => self.to_double() * o.to_double()
    Scalar64(o) => self.to_double() * o.to_double()
    Number(o) => self.to_double() * o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self.to_double() * o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Float with fn __div__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_f : Double = if o { 1.0 } else { 0.0 }
      (self.to_double() / o_f) as &Any
    }
    Scalar8(o) => self.to_double() / o.to_int().to_double()
    Scalar16(o) => self.to_double() / o.to_int().to_double()
    Scalar32(o) => self.to_double() / o.to_double()
    Scalar64(o) => self.to_double() / o.to_double()
    Number(o) => self.to_double() / o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self.to_double() / o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Float with fn __mod__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_f : Double = if o { 1.0 } else { 0.0 }
      (self.to_double() % o_f) as &Any
    }
    Scalar8(o) => self.to_double() % o.to_int().to_double()
    Scalar16(o) => self.to_double() % o.to_int().to_double()
    Scalar32(o) => self.to_double() % o.to_double()
    Scalar64(o) => self.to_double() % o.to_double()
    Number(o) => self.to_double() % o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => @double.not_a_number
      } noraise {
        o_num => self.to_double() % o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Float with fn __eq__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_f : Double = if o { 1.0 } else { 0.0 }
      self.to_double() == o_f
    }
    Scalar8(o) => self.to_double() == o.to_int().to_double()
    Scalar16(o) => self.to_double() == o.to_int().to_double()
    Scalar32(o) => self.to_double() == o.to_double()
    Scalar64(o) => self.to_double() == o.to_double()
    Number(o) => self.to_double() == o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_double() == o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Float with fn __compare__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_f : Double = if o { 1.0 } else { 0.0 }
      self.to_double().compare(o_f)
    }
    Scalar8(o) => self.to_double().compare(o.to_int().to_double())
    Scalar16(o) => self.to_double().compare(o.to_int().to_double())
    Scalar32(o) => self.to_double().compare(o.to_double())
    Scalar64(o) => self.to_double().compare(o.to_double())
    Number(o) => self.to_double().compare(o)
    _ => raise NoImpl
  }
}

///|
pub impl Any for Float with fn __ge__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_f : Double = if o { 1.0 } else { 0.0 }
      self.to_double() >= o_f
    }
    Scalar8(o) => self.to_double() >= o.to_int().to_double()
    Scalar16(o) => self.to_double() >= o.to_int().to_double()
    Scalar32(o) => self.to_double() >= o.to_double()
    Scalar64(o) => self.to_double() >= o.to_double()
    Number(o) => self.to_double() >= o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_double() >= o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Float with fn __gt__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_f : Double = if o { 1.0 } else { 0.0 }
      self.to_double() > o_f
    }
    Scalar8(o) => self.to_double() > o.to_int().to_double()
    Scalar16(o) => self.to_double() > o.to_int().to_double()
    Scalar32(o) => self.to_double() > o.to_double()
    Scalar64(o) => self.to_double() > o.to_double()
    Number(o) => self.to_double() > o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_double() > o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Float with fn __le__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_f : Double = if o { 1.0 } else { 0.0 }
      self.to_double() <= o_f
    }
    Scalar8(o) => self.to_double() <= o.to_int().to_double()
    Scalar16(o) => self.to_double() <= o.to_int().to_double()
    Scalar32(o) => self.to_double() <= o.to_double()
    Scalar64(o) => self.to_double() <= o.to_double()
    Number(o) => self.to_double() <= o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_double() <= o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Float with fn __lt__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let o_f : Double = if o { 1.0 } else { 0.0 }
      self.to_double() < o_f
    }
    Scalar8(o) => self.to_double() < o.to_int().to_double()
    Scalar16(o) => self.to_double() < o.to_int().to_double()
    Scalar32(o) => self.to_double() < o.to_double()
    Scalar64(o) => self.to_double() < o.to_double()
    Number(o) => self.to_double() < o
    Chars(o) =>
      try @string.parse_double(o) catch {
        _ => false
      } noraise {
        o_num => self.to_double() < o_num
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Float with fn __neg__(self) {
  -self.to_double()
}

///|
pub impl Any for Float with fn __repr__(self) {
  self.to_string()
}

///|
pub impl Any for BigInt with fn __add__(self, other) {
  match other.layer() {
    Integer(o) => (self + o) as &Any
    Chars(o) => self.to_string() + o
    _ => raise NoImpl
  }
}

///|
pub impl Any for BigInt with fn __sub__(self, other) {
  match other.layer() {
    Integer(o) => self - o
    _ => raise NoImpl
  }
}

///|
pub impl Any for BigInt with fn __mul__(self, other) {
  match other.layer() {
    Integer(o) => self * o
    _ => raise NoImpl
  }
}

///|
pub impl Any for BigInt with fn __div__(self, other) {
  match other.layer() {
    Integer(o) => self / o
    _ => raise NoImpl
  }
}

///|
pub impl Any for BigInt with fn __mod__(self, other) {
  match other.layer() {
    Integer(o) => self % o
    _ => raise NoImpl
  }
}

///|
pub impl Any for BigInt with fn __eq__(self, other) {
  match other.layer() {
    Integer(o) => self == o
    _ => raise NoImpl
  }
}

///|
pub impl Any for BigInt with fn __compare__(self, other) {
  match other.layer() {
    Integer(o) => self.compare(o)
    _ => raise NoImpl
  }
}

///|
pub impl Any for BigInt with fn __ge__(self, other) {
  match other.layer() {
    Integer(o) => self >= o
    _ => raise NoImpl
  }
}

///|
pub impl Any for BigInt with fn __gt__(self, other) {
  match other.layer() {
    Integer(o) => self > o
    _ => raise NoImpl
  }
}

///|
pub impl Any for BigInt with fn __le__(self, other) {
  match other.layer() {
    Integer(o) => self <= o
    _ => raise NoImpl
  }
}

///|
pub impl Any for BigInt with fn __lt__(self, other) {
  match other.layer() {
    Integer(o) => self < o
    _ => raise NoImpl
  }
}

///|
pub impl Any for BigInt with fn __neg__(self) {
  -self
}

///|
pub impl Any for BigInt with fn __repr__(self) {
  self.to_string()
}

///|
pub impl Any for Char with fn __add__(self, other) {
  match other.layer() {
    Boolean(o) => (self.to_string() + o.to_string()) as &Any
    Scalar8(o) => self.to_string() + o.to_string()
    Scalar16(o) => self.to_string() + o.to_string()
    Scalar32(o) => self.to_string() + o.to_string()
    Scalar64(o) => self.to_string() + o.to_string()
    Number(o) => self.to_string() + o.to_string()
    Integer(o) => self.to_string() + o.to_string()
    Chars(o) => self.to_string() + o
    Data(o) => {
      let buf = @buffer.Buffer()
      buf.write_char_utf16le(self)
      buf.write_bytes(o)
      buf.contents()
    }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Char with fn __sub__(self, other) {
  try @string.parse_double(self.to_string()) catch {
    _ => @double.not_a_number
  } noraise {
    self_num =>
      match other.layer() {
        Boolean(o) => self_num - o.to_int().to_double()
        Scalar8(o) => self_num - o.to_int().to_double()
        Scalar16(o) => self_num - o.to_int().to_double()
        Scalar32(o) => self_num - o.to_double()
        Scalar64(o) => self_num - o.to_double()
        Number(o) => self_num - o
        Chars(o) =>
          try @string.parse_double(o) catch {
            _ => @double.not_a_number
          } noraise {
            o_num => self_num - o_num
          }
        _ => raise NoImpl
      }
  }
}

///|
pub impl Any for Char with fn __mul__(self, other) {
  try @string.parse_double(self.to_string()) catch {
    _ => @double.not_a_number
  } noraise {
    self_num =>
      match other.layer() {
        Boolean(o) => self_num * o.to_int().to_double()
        Scalar8(o) => self_num * o.to_int().to_double()
        Scalar16(o) => self_num * o.to_int().to_double()
        Scalar32(o) => self_num * o.to_double()
        Scalar64(o) => self_num * o.to_double()
        Number(o) => self_num * o
        Chars(o) =>
          try @string.parse_double(o) catch {
            _ => @double.not_a_number
          } noraise {
            o_num => self_num * o_num
          }
        _ => raise NoImpl
      }
  }
}

///|
pub impl Any for Char with fn __div__(self, other) {
  try @string.parse_double(self.to_string()) catch {
    _ => @double.not_a_number
  } noraise {
    self_num =>
      match other.layer() {
        Boolean(o) => self_num / o.to_int().to_double()
        Scalar8(o) => self_num / o.to_int().to_double()
        Scalar16(o) => self_num / o.to_int().to_double()
        Scalar32(o) => self_num / o.to_double()
        Scalar64(o) => self_num / o.to_double()
        Number(o) => self_num / o
        Chars(o) =>
          try @string.parse_double(o) catch {
            _ => @double.not_a_number
          } noraise {
            o_num => self_num / o_num
          }
        _ => raise NoImpl
      }
  }
}

///|
pub impl Any for Char with fn __mod__(self, other) {
  try @string.parse_double(self.to_string()) catch {
    _ => @double.not_a_number
  } noraise {
    self_num =>
      match other.layer() {
        Boolean(o) => self_num % o.to_int().to_double()
        Scalar8(o) => self_num % o.to_int().to_double()
        Scalar16(o) => self_num % o.to_int().to_double()
        Scalar32(o) => self_num % o.to_double()
        Scalar64(o) => self_num % o.to_double()
        Number(o) => self_num % o
        Chars(o) =>
          try @string.parse_double(o) catch {
            _ => @double.not_a_number
          } noraise {
            o_num => self_num % o_num
          }
        _ => raise NoImpl
      }
  }
}

///|
pub impl Any for Char with fn __eq__(self, other) {
  match other.layer() {
    Chars(o) => self.to_string() == o
    Data(o) => {
      let self_bytes = @buffer.Buffer()
      self_bytes.write_char_utf16le(self)
      self_bytes.contents() == o
    }
    Boolean(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => false
      } noraise {
        self_num => {
          let o_d : Double = if o { 1.0 } else { 0.0 }
          self_num == o_d
        }
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Char with fn __compare__(self, other) {
  match other.layer() {
    Boolean(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string().compare((if o { 1 } else { 0 }).to_string())
      } noraise {
        self_num => {
          let o_d : Double = if o { 1.0 } else { 0.0 }
          self_num.compare(o_d)
        }
      }
    Scalar8(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string().compare(o.to_string())
      } noraise {
        self_num => self_num.compare(o.to_int().to_double())
      }
    Scalar16(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string().compare(o.to_string())
      } noraise {
        self_num => self_num.compare(o.to_int().to_double())
      }
    Scalar32(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string().compare(o.to_string())
      } noraise {
        self_num => self_num.compare(o.to_double())
      }
    Scalar64(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string().compare(o.to_string())
      } noraise {
        self_num => self_num.compare(o.to_double())
      }
    Number(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string().compare(o.to_string())
      } noraise {
        self_num => self_num.compare(o)
      }
    Chars(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string().compare(o)
      } noraise {
        self_num =>
          try @string.parse_double(o) catch {
            _ => self.to_string().compare(o)
          } noraise {
            o_num => self_num.compare(o_num)
          }
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Char with fn __ge__(self, other) {
  match other.layer() {
    Boolean(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() >= (if o { 1 } else { 0 }).to_string()
      } noraise {
        self_num => {
          let o_d : Double = if o { 1.0 } else { 0.0 }
          self_num >= o_d
        }
      }
    Scalar8(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() >= o.to_string()
      } noraise {
        self_num => self_num >= o.to_int().to_double()
      }
    Scalar16(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() >= o.to_string()
      } noraise {
        self_num => self_num >= o.to_int().to_double()
      }
    Scalar32(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() >= o.to_string()
      } noraise {
        self_num => self_num >= o.to_double()
      }
    Scalar64(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() >= o.to_string()
      } noraise {
        self_num => self_num >= o.to_double()
      }
    Number(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() >= o.to_string()
      } noraise {
        self_num => self_num >= o
      }
    Chars(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() >= o
      } noraise {
        self_num =>
          try @string.parse_double(o) catch {
            _ => self.to_string() >= o
          } noraise {
            o_num => self_num >= o_num
          }
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Char with fn __gt__(self, other) {
  match other.layer() {
    Boolean(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() > (if o { 1 } else { 0 }).to_string()
      } noraise {
        self_num => {
          let o_d : Double = if o { 1.0 } else { 0.0 }
          self_num > o_d
        }
      }
    Scalar8(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() > o.to_string()
      } noraise {
        self_num => self_num > o.to_int().to_double()
      }
    Scalar16(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() > o.to_string()
      } noraise {
        self_num => self_num > o.to_int().to_double()
      }
    Scalar32(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() > o.to_string()
      } noraise {
        self_num => self_num > o.to_double()
      }
    Scalar64(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() > o.to_string()
      } noraise {
        self_num => self_num > o.to_double()
      }
    Number(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() > o.to_string()
      } noraise {
        self_num => self_num > o
      }
    Chars(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() > o
      } noraise {
        self_num =>
          try @string.parse_double(o) catch {
            _ => self.to_string() > o
          } noraise {
            o_num => self_num > o_num
          }
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Char with fn __le__(self, other) {
  match other.layer() {
    Boolean(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() <= (if o { 1 } else { 0 }).to_string()
      } noraise {
        self_num => {
          let o_d : Double = if o { 1.0 } else { 0.0 }
          self_num <= o_d
        }
      }
    Scalar8(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() <= o.to_string()
      } noraise {
        self_num => self_num <= o.to_int().to_double()
      }
    Scalar16(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() <= o.to_string()
      } noraise {
        self_num => self_num <= o.to_int().to_double()
      }
    Scalar32(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() <= o.to_string()
      } noraise {
        self_num => self_num <= o.to_double()
      }
    Scalar64(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() <= o.to_string()
      } noraise {
        self_num => self_num <= o.to_double()
      }
    Number(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() <= o.to_string()
      } noraise {
        self_num => self_num <= o
      }
    Chars(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() <= o
      } noraise {
        self_num =>
          try @string.parse_double(o) catch {
            _ => self.to_string() <= o
          } noraise {
            o_num => self_num <= o_num
          }
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Char with fn __lt__(self, other) {
  match other.layer() {
    Boolean(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() < (if o { 1 } else { 0 }).to_string()
      } noraise {
        self_num => {
          let o_d : Double = if o { 1.0 } else { 0.0 }
          self_num < o_d
        }
      }
    Scalar8(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() < o.to_string()
      } noraise {
        self_num => self_num < o.to_int().to_double()
      }
    Scalar16(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() < o.to_string()
      } noraise {
        self_num => self_num < o.to_int().to_double()
      }
    Scalar32(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() < o.to_string()
      } noraise {
        self_num => self_num < o.to_double()
      }
    Scalar64(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() < o.to_string()
      } noraise {
        self_num => self_num < o.to_double()
      }
    Number(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() < o.to_string()
      } noraise {
        self_num => self_num < o
      }
    Chars(o) =>
      try @string.parse_double(self.to_string()) catch {
        _ => self.to_string() < o
      } noraise {
        self_num =>
          try @string.parse_double(o) catch {
            _ => self.to_string() < o
          } noraise {
            o_num => self_num < o_num
          }
      }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Char with fn __neg__(self) {
  try @string.parse_double(self.to_string()) catch {
    _ => @double.not_a_number
  } noraise {
    self_num => -self_num
  }
}

///|
pub impl Any for Char with fn __repr__(self) {
  self.to_string()
}

///|
pub impl Any for String with fn __add__(self, other) {
  match other.layer() {
    Boolean(o) => (self + o.to_string()) as &Any
    Scalar8(o) => self + o.to_string()
    Scalar16(o) => self + o.to_string()
    Scalar32(o) => self + o.to_string()
    Scalar64(o) => self + o.to_string()
    Number(o) => self + o.to_string()
    Integer(o) => self + o.to_string()
    Chars(o) => self + o
    Data(o) => {
      let buf = @buffer.Buffer()
      buf.write_string_utf16le(self)
      buf.write_bytes(o)
      buf.contents()
    }
    _ => raise NoImpl
  }
}

///|
pub impl Any for String with fn __sub__(self, other) {
  try @string.parse_double(self) catch {
    _ => @double.not_a_number
  } noraise {
    s_num =>
      match other.layer() {
        Boolean(o) => s_num - o.to_int().to_double()
        Scalar8(o) => s_num - o.to_int().to_double()
        Scalar16(o) => s_num - o.to_int().to_double()
        Scalar32(o) => s_num - o.to_double()
        Scalar64(o) => s_num - o.to_double()
        Number(o) => s_num - o
        Chars(o) =>
          try @string.parse_double(o) catch {
            _ => @double.not_a_number
          } noraise {
            o_num => s_num - o_num
          }
        _ => raise NoImpl
      }
  }
}

///|
pub impl Any for String with fn __mul__(self, other) {
  try @string.parse_double(self) catch {
    _ => @double.not_a_number
  } noraise {
    s_num =>
      match other.layer() {
        Boolean(o) => s_num * o.to_int().to_double()
        Scalar8(o) => s_num * o.to_int().to_double()
        Scalar16(o) => s_num * o.to_int().to_double()
        Scalar32(o) => s_num * o.to_double()
        Scalar64(o) => s_num * o.to_double()
        Number(o) => s_num * o
        Chars(o) =>
          try @string.parse_double(o) catch {
            _ => @double.not_a_number
          } noraise {
            o_num => s_num * o_num
          }
        _ => raise NoImpl
      }
  }
}

///|
pub impl Any for String with fn __div__(self, other) {
  try @string.parse_double(self) catch {
    _ => @double.not_a_number
  } noraise {
    s_num =>
      match other.layer() {
        Boolean(o) => s_num / o.to_int().to_double()
        Scalar8(o) => s_num / o.to_int().to_double()
        Scalar16(o) => s_num / o.to_int().to_double()
        Scalar32(o) => s_num / o.to_double()
        Scalar64(o) => s_num / o.to_double()
        Number(o) => s_num / o
        Chars(o) =>
          try @string.parse_double(o) catch {
            _ => @double.not_a_number
          } noraise {
            o_num => s_num / o_num
          }
        _ => raise NoImpl
      }
  }
}

///|
pub impl Any for String with fn __mod__(self, other) {
  try @string.parse_double(self) catch {
    _ => @double.not_a_number
  } noraise {
    s_num =>
      match other.layer() {
        Boolean(o) => s_num % o.to_int().to_double()
        Scalar8(o) => s_num % o.to_int().to_double()
        Scalar16(o) => s_num % o.to_int().to_double()
        Scalar32(o) => s_num % o.to_double()
        Scalar64(o) => s_num % o.to_double()
        Number(o) => s_num % o
        Chars(o) =>
          try @string.parse_double(o) catch {
            _ => @double.not_a_number
          } noraise {
            o_num => s_num % o_num
          }
        _ => raise NoImpl
      }
  }
}

///|
pub impl Any for String with fn __compare__(self, other) {
  match other.layer() {
    Boolean(o) =>
      try @string.parse_double(self) catch {
        _ => self.compare((if o { 1 } else { 0 }).to_string())
      } noraise {
        s_num => {
          let o_d : Double = if o { 1.0 } else { 0.0 }
          s_num.compare(o_d)
        }
      }
    Scalar8(o) =>
      try @string.parse_double(self) catch {
        _ => self.compare(o.to_string())
      } noraise {
        s_num => s_num.compare(o.to_int().to_double())
      }
    Scalar16(o) =>
      try @string.parse_double(self) catch {
        _ => self.compare(o.to_string())
      } noraise {
        s_num => s_num.compare(o.to_int().to_double())
      }
    Scalar32(o) =>
      try @string.parse_double(self) catch {
        _ => self.compare(o.to_string())
      } noraise {
        s_num => s_num.compare(o.to_double())
      }
    Scalar64(o) =>
      try @string.parse_double(self) catch {
        _ => self.compare(o.to_string())
      } noraise {
        s_num => s_num.compare(o.to_double())
      }
    Number(o) =>
      try @string.parse_double(self) catch {
        _ => self.compare(o.to_string())
      } noraise {
        s_num => s_num.compare(o)
      }
    Chars(o) => self.compare(o)
    _ => raise NoImpl
  }
}

///|
pub impl Any for String with fn __ge__(self, other) {
  match other.layer() {
    Boolean(o) =>
      try @string.parse_double(self) catch {
        _ => self >= (if o { 1 } else { 0 }).to_string()
      } noraise {
        s_num => {
          let o_d : Double = if o { 1.0 } else { 0.0 }
          s_num >= o_d
        }
      }
    Scalar8(o) =>
      try @string.parse_double(self) catch {
        _ => self >= o.to_string()
      } noraise {
        s_num => s_num >= o.to_int().to_double()
      }
    Scalar16(o) =>
      try @string.parse_double(self) catch {
        _ => self >= o.to_string()
      } noraise {
        s_num => s_num >= o.to_int().to_double()
      }
    Scalar32(o) =>
      try @string.parse_double(self) catch {
        _ => self >= o.to_string()
      } noraise {
        s_num => s_num >= o.to_double()
      }
    Scalar64(o) =>
      try @string.parse_double(self) catch {
        _ => self >= o.to_string()
      } noraise {
        s_num => s_num >= o.to_double()
      }
    Number(o) =>
      try @string.parse_double(self) catch {
        _ => self >= o.to_string()
      } noraise {
        s_num => s_num >= o
      }
    Chars(o) => self >= o
    _ => raise NoImpl
  }
}

///|
pub impl Any for String with fn __gt__(self, other) {
  match other.layer() {
    Boolean(o) =>
      try @string.parse_double(self) catch {
        _ => self > (if o { 1 } else { 0 }).to_string()
      } noraise {
        s_num => {
          let o_d : Double = if o { 1.0 } else { 0.0 }
          s_num > o_d
        }
      }
    Scalar8(o) =>
      try @string.parse_double(self) catch {
        _ => self > o.to_string()
      } noraise {
        s_num => s_num > o.to_int().to_double()
      }
    Scalar16(o) =>
      try @string.parse_double(self) catch {
        _ => self > o.to_string()
      } noraise {
        s_num => s_num > o.to_int().to_double()
      }
    Scalar32(o) =>
      try @string.parse_double(self) catch {
        _ => self > o.to_string()
      } noraise {
        s_num => s_num > o.to_double()
      }
    Scalar64(o) =>
      try @string.parse_double(self) catch {
        _ => self > o.to_string()
      } noraise {
        s_num => s_num > o.to_double()
      }
    Number(o) =>
      try @string.parse_double(self) catch {
        _ => self > o.to_string()
      } noraise {
        s_num => s_num > o
      }
    Chars(o) => self > o
    _ => raise NoImpl
  }
}

///|
pub impl Any for String with fn __le__(self, other) {
  match other.layer() {
    Boolean(o) =>
      try @string.parse_double(self) catch {
        _ => self <= (if o { 1 } else { 0 }).to_string()
      } noraise {
        s_num => {
          let o_d : Double = if o { 1.0 } else { 0.0 }
          s_num <= o_d
        }
      }
    Scalar8(o) =>
      try @string.parse_double(self) catch {
        _ => self <= o.to_string()
      } noraise {
        s_num => s_num <= o.to_int().to_double()
      }
    Scalar16(o) =>
      try @string.parse_double(self) catch {
        _ => self <= o.to_string()
      } noraise {
        s_num => s_num <= o.to_int().to_double()
      }
    Scalar32(o) =>
      try @string.parse_double(self) catch {
        _ => self <= o.to_string()
      } noraise {
        s_num => s_num <= o.to_double()
      }
    Scalar64(o) =>
      try @string.parse_double(self) catch {
        _ => self <= o.to_string()
      } noraise {
        s_num => s_num <= o.to_double()
      }
    Number(o) =>
      try @string.parse_double(self) catch {
        _ => self <= o.to_string()
      } noraise {
        s_num => s_num <= o
      }
    Chars(o) => self <= o
    _ => raise NoImpl
  }
}

///|
pub impl Any for String with fn __lt__(self, other) {
  match other.layer() {
    Boolean(o) =>
      try @string.parse_double(self) catch {
        _ => self < (if o { 1 } else { 0 }).to_string()
      } noraise {
        s_num => {
          let o_d : Double = if o { 1.0 } else { 0.0 }
          s_num < o_d
        }
      }
    Scalar8(o) =>
      try @string.parse_double(self) catch {
        _ => self < o.to_string()
      } noraise {
        s_num => s_num < o.to_int().to_double()
      }
    Scalar16(o) =>
      try @string.parse_double(self) catch {
        _ => self < o.to_string()
      } noraise {
        s_num => s_num < o.to_int().to_double()
      }
    Scalar32(o) =>
      try @string.parse_double(self) catch {
        _ => self < o.to_string()
      } noraise {
        s_num => s_num < o.to_double()
      }
    Scalar64(o) =>
      try @string.parse_double(self) catch {
        _ => self < o.to_string()
      } noraise {
        s_num => s_num < o.to_double()
      }
    Number(o) =>
      try @string.parse_double(self) catch {
        _ => self < o.to_string()
      } noraise {
        s_num => s_num < o
      }
    Chars(o) => self < o
    _ => raise NoImpl
  }
}

///|
pub impl Any for String with fn __neg__(self) {
  try @string.parse_double(self) catch {
    _ => @double.not_a_number
  } noraise {
    s_num => -s_num
  }
}

///|
pub impl Any for String with fn __repr__(self) {
  self
}

///|
pub impl Any for Bytes with fn __add__(self, other) {
  match other.layer() {
    Boolean(o) => {
      let buf = @buffer.Buffer()
      buf.write_bytes(self)
      buf.write_byte(if o { 1 } else { 0 })
      buf.contents()
    }
    Scalar8(o) => {
      let buf = @buffer.Buffer()
      buf.write_bytes(self)
      buf.write_byte(o)
      buf.contents()
    }
    Scalar16(o) => {
      let buf = @buffer.Buffer()
      buf.write_bytes(self)
      buf.write_int16_be(o)
      buf.contents()
    }
    Scalar32(o) => {
      let buf = @buffer.Buffer()
      buf.write_bytes(self)
      buf.write_int_le(o)
      buf.contents()
    }
    Scalar64(o) => {
      let buf = @buffer.Buffer()
      buf.write_bytes(self)
      buf.write_int64_le(o)
      buf.contents()
    }
    Number(o) => {
      let buf = @buffer.Buffer()
      buf.write_bytes(self)
      buf.write_double_le(o)
      buf.contents()
    }
    Chars(o) => {
      let buf = @buffer.Buffer()
      buf.write_bytes(self)
      buf.write_string_utf16le(o)
      buf.contents()
    }
    Data(o) => {
      let buf = @buffer.Buffer()
      buf.write_bytes(self)
      buf.write_bytes(o)
      buf.contents()
    }
    _ => raise NoImpl
  }
}

///|
pub impl Any for Bytes with fn __eq__(self, other) {
  match other.layer() {
    Data(o) => self == o
    _ => raise NoImpl
  }
}

///|
pub impl Any for Bytes with fn __compare__(self, other) {
  match other.layer() {
    Data(o) => self.compare(o)
    _ => raise NoImpl
  }
}

///|
pub impl Any for Bytes with fn __ge__(self, other) {
  match other.layer() {
    Data(o) => self >= o
    _ => raise NoImpl
  }
}

///|
pub impl Any for Bytes with fn __gt__(self, other) {
  match other.layer() {
    Data(o) => self > o
    _ => raise NoImpl
  }
}

///|
pub impl Any for Bytes with fn __le__(self, other) {
  match other.layer() {
    Data(o) => self <= o
    _ => raise NoImpl
  }
}

///|
pub impl Any for Bytes with fn __lt__(self, other) {
  match other.layer() {
    Data(o) => self < o
    _ => raise NoImpl
  }
}

///|
pub impl Any for Bytes with fn __repr__(self) {
  self.to_string()
}
