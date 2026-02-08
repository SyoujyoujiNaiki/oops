///|
pub trait Any {
  __type__(Self) -> String
  __data__(Self) -> Bytes
  __str__(Self) -> String = _
  __eq__(Self, &Any) -> Bool = _
  __add__(Self, &Any) -> &Any = _
  __sub__(Self, &Any) -> &Any = _
  __mul__(Self, &Any) -> &Any = _
  __div__(Self, &Any) -> &Any = _
  __compare__(Self, &Any) -> Int = _
  __ge__(Self, &Any) -> Bool = _
  __gt__(Self, &Any) -> Bool = _
  __le__(Self, &Any) -> Bool = _
  __lt__(Self, &Any) -> Bool = _
  __neg__(Self) -> &Any = _
  __bool__(Self) -> Bool = _
  __hash__(Self) -> Int = _
}

// Default implementation for Any trait.

///|
impl Any with __bool__(self) {
  Any::__type__(self) != "Null" || Any::__type__(self) != "Undefined"
}

///|
impl Any with __str__(self) {
  Any::__str__(Any::__data__(self))
}

///|
impl Any with __eq__(self, other) {
  Any::__data__(self) == Any::__data__(other)
}

///|
impl Any with __add__(_, _) {
  Undefined::{  }
}

///|
impl Any with __sub__(_, _) {
  Undefined::{  }
}

///|
impl Any with __mul__(_, _) {
  Undefined::{  }
}

///|
impl Any with __div__(_, _) {
  Undefined::{  }
}

///|
impl Any with __neg__(_) {
  Undefined::{  }
}

///|
impl Any with __compare__(_, _) {
  0
}

///|
impl Any with __ge__(_, _) {
  false
}

///|
impl Any with __gt__(_, _) {
  false
}

///|
impl Any with __le__(_, _) {
  false
}

///|
impl Any with __lt__(_, _) {
  false
}

///|
impl Any with __hash__(self) {
  Any::__data__(self).hash()
}

// Implement overloaded operator for Any trait

///|
pub impl Add for &Any with add(self, other) {
  Any::__add__(self, other)
}

///|
pub impl Sub for &Any with sub(self, other) {
  Any::__sub__(self, other)
}

///|
pub impl Mul for &Any with mul(self, other) {
  Any::__mul__(self, other)
}

///|
pub impl Div for &Any with div(self, other) {
  Any::__div__(self, other)
}

///|
pub impl Neg for &Any with neg(self) {
  Any::__neg__(self)
}

///|
pub impl Eq for &Any with equal(self, other) {
  Any::__eq__(self, other)
}

///|
pub impl Compare for &Any with compare(self, other) {
  Any::__compare__(self, other)
}

///|
pub impl Compare for &Any with op_ge(self, other) {
  Any::__ge__(self, other)
}

///|
pub impl Compare for &Any with op_gt(self, other) {
  Any::__gt__(self, other)
}

///|
pub impl Compare for &Any with op_le(self, other) {
  Any::__le__(self, other)
}

///|
pub impl Compare for &Any with op_lt(self, other) {
  Any::__lt__(self, other)
}

// Implement hash for Any trait.

///|
pub impl Hash for &Any with hash(self) {
  Any::__hash__(self)
}

///|
pub impl Hash for &Any with hash_combine(self, hasher) {
  hasher.combine(Any::__data__(self))
}

///|
pub impl Show for &Any with to_string(self) {
  Any::__str__(self)
}

///|
pub impl Show for &Any with output(self, logger) {
  logger.write_string(Any::__str__(self))
}

// Implement Any trait for built-in types.

///|
/// Implement Any trait for type Bool.
pub impl Any for Bool with __type__(_) {
  "Boolean"
}

///|
/// Implement Any trait for type Double.
pub impl Any for Double with __type__(_) {
  "Number"
}

///|
/// Implement Any trait for type Float.
/// Single precision floating point is extended to double precision.
pub impl Any for Float with __type__(_) {
  "Number"
}

///|
/// Implement Any trait for type Int16.
/// Int16 is extended to Int32.
pub impl Any for Int16 with __type__(_) {
  "Number"
}

///|
/// Implement Any trait for type Int16.
/// Int16 is extended to Int32.
pub impl Any for Int with __type__(_) {
  "Number"
}

///|
/// Implement Any trait for type Int16.
/// Int16 is extended to Int32.
pub impl Any for UInt16 with __type__(_) {
  "Number"
}

///|
/// Implement Any trait for type Int16.
/// Int16 is extended to Int32.
pub impl Any for UInt with __type__(_) {
  "Number"
}

///|
pub impl Any for BigInt with __type__(_) {
  "BigInt"
}

///|
pub impl Any for Int64 with __type__(_) {
  "BigInt"
}

///|
pub impl Any for UInt64 with __type__(_) {
  "BigInt"
}

///|
/// Implement Any trait for type Byte.
/// Byte is a Bytes with single Byte.
pub impl Any for Byte with __type__(_) {
  "Bytes"
}

///|
/// Implement Any trait for type Bytes.
pub impl Any for Bytes with __type__(_) {
  "Bytes"
}

///|
/// Implement Any trait for type Char.
/// A Char is treated as a String with single Char
pub impl Any for Char with __type__(_) {
  "String"
}

///|
/// Implement Any trait for type String.
pub impl Any for String with __type__(_) {
  "String"
}

///|
pub impl Any for Array[&Any] with __type__(_) {
  "Array"
}

///|
/// Implement Any trait for type FixedArray[&Any].
pub impl Any for FixedArray[&Any] with __type__(_) {
  "Array"
}

///|
/// Implement Any trait for type Unit.
pub impl Any for Unit with __type__(_) {
  "Void"
}

///|
/// Implement Any trait for type Unit.
pub impl Any for Json with __type__(_) {
  "Struct"
}

///|
/// Implement Any trait for type Bool.
/// Bool is implemented as a Int which value of 1 presents True and value of 0 presents False.
pub impl Any for Bool with __data__(self) {
  let buf = @buffer.new(size_hint=8)
  if self {
    buf.write_double_le(1)
  } else {
    buf.write_double_le(0)
  }
  buf.contents()
}

///|
/// Implement Any trait for type Double.
pub impl Any for Double with __data__(self) {
  let buf = @buffer.new(size_hint=8)
  buf.write_double_le(self)
  buf.contents()
}

///|
/// Implement Any trait for type Float.
/// Single precision floating point is extended to double precision.
pub impl Any for Float with __data__(self) {
  let buf = @buffer.new(size_hint=8)
  buf.write_double_le(self.to_double())
  buf.contents()
}

///|
/// Implement Any trait for type Int16.
pub impl Any for Int16 with __data__(self) {
  let buf = @buffer.new(size_hint=8)
  buf.write_double_le(self.to_int().to_double())
  buf.contents()
}

///|
/// Implement Any trait for type Int.
pub impl Any for Int with __data__(self) {
  let buf = @buffer.new(size_hint=8)
  buf.write_double_le(self.to_double())
  buf.contents()
}

///|
/// Implement Any trait for type UInt16.
pub impl Any for UInt16 with __data__(self) {
  let buf = @buffer.new(size_hint=8)
  buf.write_double_le(self.to_uint().to_double())
  buf.contents()
}

///|
/// Implement Any trait for type UInt.
/// As the range of UInt exceeds that of Int, UInt is extended to BigInt
pub impl Any for UInt with __data__(self) {
  let buf = @buffer.new(size_hint=8)
  buf.write_double_le(self.to_double())
  buf.contents()
}

///|
pub impl Any for BigInt with __data__(self) {
  let buf = @buffer.new()
  buf.write_string_utf16le(self.to_string())
  buf.contents()
}

///|
/// Implement Any trait for type Int64.
/// As the range of Int64 exceeds that of Int, Int64 is extended to BigInt
pub impl Any for Int64 with __data__(self) {
  let buf = @buffer.new()
  buf.write_string_utf16le(BigInt::from_int64(self).to_string())
  buf.contents()
}

///|
/// Implement Any trait for type UInt64.
/// As the range of UInt64 exceeds that of Int, UInt64 is extended to BigInt
pub impl Any for UInt64 with __data__(self) {
  let buf = @buffer.new()
  buf.write_string_utf16le(BigInt::from_uint64(self).to_string())
  buf.contents()
}

///|
/// Implement Any trait for type Byte.
pub impl Any for Byte with __data__(self) {
  [self]
}

///|
/// Implement Any trait for type Bytes.
/// Bytes itself is the fundation of Any trait.
pub impl Any for Bytes with __data__(self) {
  self
}

///|
/// Implement Any trait for type Char.
pub impl Any for Char with __data__(self) {
  let buf = @buffer.new()
  buf.write_string_utf16le(self.to_string())
  buf.contents()
}

///|
/// Implement Any trait for type String.
pub impl Any for String with __data__(self) {
  let buf = @buffer.new()
  buf.write_string_utf16le(self)
  buf.contents()
}

///|
/// Implement Any trait for type Array[&Any].
pub impl Any for Array[&Any] with __data__(self) {
  let buf = @buffer.new()
  for a in self {
    buf.write_bytes(a.__data__())
  }
  buf.contents()
}

///|
/// Implement Any trait for type FixedArray[&Any].
pub impl Any for FixedArray[&Any] with __data__(self) {
  let buf = @buffer.new()
  for a in self {
    buf.write_bytes(a.__data__())
  }
  buf.contents()
}

///|
/// Implement Any trait for type Unit.
/// Unit has no data
pub impl Any for Unit with __data__(_) {
  Bytes::new(0)
}

///|
/// Implement Any trait for type Json.
pub impl Any for Json with __data__(self) {
  let buf = @buffer.new()
  buf.write_string_utf16le(self.stringify())
  buf.contents()
}

///|
pub impl Any for Array[&Any] with __add__(self, other) {
  (Any::__str__(self) + Any::__str__(other)) as &Any
}

///|
pub impl Any for FixedArray[&Any] with __add__(self, other) {
  (Any::__str__(self) + Any::__str__(other)) as &Any
}

///|
pub impl Any for Bool with __add__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => (Any::__str__(self) + Any::__str__(other)) as &Any
    "Boolean" | "Number" | "Null" => number(self) + number(other)
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Double with __add__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => (Any::__str__(self) + Any::__str__(other)) as &Any
    "Boolean" | "Number" | "Null" => number(self) + number(other)
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Float with __add__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => (Any::__str__(self) + Any::__str__(other)) as &Any
    "Boolean" | "Number" | "Null" => number(self) + number(other)
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Int16 with __add__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => (Any::__str__(self) + Any::__str__(other)) as &Any
    "Boolean" | "Number" | "Null" => number(self) + number(other)
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Int with __add__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => (Any::__str__(self) + Any::__str__(other)) as &Any
    "Boolean" | "Number" | "Null" => number(self) + number(other)
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for UInt16 with __add__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => (Any::__str__(self) + Any::__str__(other)) as &Any
    "Boolean" | "Number" | "Null" => number(self) + number(other)
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for UInt with __add__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => (Any::__str__(self) + Any::__str__(other)) as &Any
    "Boolean" | "Number" | "Null" => number(self) + number(other)
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for BigInt with __add__(self, other) {
  let self_bi = self
  match Any::__type__(other) {
    "Array" | "String" => (Any::__str__(self) + Any::__str__(other)) as &Any
    "BigInt" =>
      try BigInt::from_string(@utf16.decode(&Any::__data__(other))) catch {
        Malformed(_) => Undefined::{  } as &Any
      } noraise {
        other_bi => self_bi + other_bi
      }
    _ => Undefined::{  }
  }
}

///|
pub impl Any for Int64 with __add__(self, other) {
  let self_bi = BigInt::from_int64(self)
  match Any::__type__(other) {
    "Array" | "String" => (Any::__str__(self) + Any::__str__(other)) as &Any
    "BigInt" =>
      try BigInt::from_string(@utf16.decode(&Any::__data__(other))) catch {
        Malformed(_) => Undefined::{  } as &Any
      } noraise {
        other_bi => self_bi + other_bi
      }
    _ => Undefined::{  }
  }
}

///|
pub impl Any for UInt64 with __add__(self, other) {
  let self_bi = BigInt::from_uint64(self)
  match Any::__type__(other) {
    "Array" | "String" => (Any::__str__(self) + Any::__str__(other)) as &Any
    "BigInt" =>
      try BigInt::from_string(@utf16.decode(&Any::__data__(other))) catch {
        Malformed(_) => Undefined::{  } as &Any
      } noraise {
        other_bi => self_bi + other_bi
      }
    _ => Undefined::{  }
  }
}

///|
pub impl Any for Byte with __add__(self, other) {
  Any::__data__(self) + Any::__data__(other)
}

///|
pub impl Any for Bytes with __add__(self, other) {
  Any::__data__(self) + Any::__data__(other)
}

///|
pub impl Any for Char with __add__(self, other) {
  Any::__str__(self) + Any::__str__(other)
}

///|
pub impl Any for String with __add__(self, other) {
  Any::__str__(self) + Any::__str__(other)
}

///| Implement __sub__ method for built-in types

///|
pub impl Any for Array[&Any] with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for FixedArray[&Any] with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Bool with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Double with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Float with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Int16 with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Int with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for UInt16 with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for UInt with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for BigInt with __sub__(self, other) {
  let self_bi = self
  match Any::__type__(other) {
    "BigInt" =>
      try BigInt::from_string(@utf16.decode(&Any::__data__(other))) catch {
        Malformed(_) => Undefined::{  } as &Any
      } noraise {
        other_bi => (self_bi - other_bi) as &Any
      }
    _ => Undefined::{  }
  }
}

///|
pub impl Any for Int64 with __sub__(self, other) {
  let self_bi = BigInt::from_int64(self)
  match Any::__type__(other) {
    "BigInt" =>
      try BigInt::from_string(@utf16.decode(&Any::__data__(other))) catch {
        Malformed(_) => Undefined::{  } as &Any
      } noraise {
        other_bi => (self_bi - other_bi) as &Any
      }
    _ => Undefined::{  }
  }
}

///|
pub impl Any for UInt64 with __sub__(self, other) {
  let self_bi = BigInt::from_uint64(self)
  match Any::__type__(other) {
    "BigInt" =>
      try BigInt::from_string(@utf16.decode(&Any::__data__(other))) catch {
        Malformed(_) => Undefined::{  } as &Any
      } noraise {
        other_bi => (self_bi - other_bi) as &Any
      }
    _ => Undefined::{  }
  }
}

///|
pub impl Any for Char with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for String with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///| Implement __mul__ method for built-in types

///|
pub impl Any for Array[&Any] with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for FixedArray[&Any] with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Bool with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Double with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Float with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Int16 with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Int with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for UInt16 with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for UInt with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for BigInt with __mul__(self, other) {
  let self_bi = self
  match Any::__type__(other) {
    "BigInt" =>
      try BigInt::from_string(@utf16.decode(&Any::__data__(other))) catch {
        Malformed(_) => Undefined::{  } as &Any
      } noraise {
        other_bi => (self_bi * other_bi) as &Any
      }
    _ => Undefined::{  }
  }
}

///|
pub impl Any for Int64 with __mul__(self, other) {
  let self_bi = BigInt::from_int64(self)
  match Any::__type__(other) {
    "BigInt" =>
      try BigInt::from_string(@utf16.decode(&Any::__data__(other))) catch {
        Malformed(_) => Undefined::{  } as &Any
      } noraise {
        other_bi => (self_bi * other_bi) as &Any
      }
    _ => Undefined::{  }
  }
}

///|
pub impl Any for UInt64 with __mul__(self, other) {
  let self_bi = BigInt::from_uint64(self)
  match Any::__type__(other) {
    "BigInt" =>
      try BigInt::from_string(@utf16.decode(&Any::__data__(other))) catch {
        Malformed(_) => Undefined::{  } as &Any
      } noraise {
        other_bi => (self_bi * other_bi) as &Any
      }
    _ => Undefined::{  }
  }
}

///|
pub impl Any for Char with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for String with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// Implement __div__ method for built-in types
pub impl Any for Array[&Any] with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for FixedArray[&Any] with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Bool with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Double with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Float with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Int16 with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Int with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for UInt16 with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for UInt with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for BigInt with __div__(self, other) {
  let self_bi = self
  match Any::__type__(other) {
    "BigInt" =>
      try BigInt::from_string(@utf16.decode(&Any::__data__(other))) catch {
        Malformed(_) => Undefined::{  } as &Any
      } noraise {
        other_bi => (self_bi / other_bi) as &Any
      }
    _ => Undefined::{  }
  }
}

///|
pub impl Any for Int64 with __div__(self, other) {
  let self_bi = BigInt::from_int64(self)
  match Any::__type__(other) {
    "BigInt" =>
      try BigInt::from_string(@utf16.decode(&Any::__data__(other))) catch {
        Malformed(_) => Undefined::{  } as &Any
      } noraise {
        other_bi => (self_bi / other_bi) as &Any
      }
    _ => Undefined::{  }
  }
}

///|
pub impl Any for UInt64 with __div__(self, other) {
  let self_bi = BigInt::from_uint64(self)
  match Any::__type__(other) {
    "BigInt" =>
      try BigInt::from_string(@utf16.decode(&Any::__data__(other))) catch {
        Malformed(_) => Undefined::{  } as &Any
      } noraise {
        other_bi => (self_bi / other_bi) as &Any
      }
    _ => Undefined::{  }
  }
}

///|
pub impl Any for Char with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for String with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
pub impl Any for Array[&Any] with __neg__(self) {
  -number(self)
}

///|
pub impl Any for FixedArray[&Any] with __neg__(self) {
  -number(self)
}

///|
pub impl Any for Float with __neg__(self) {
  -self
}

///|
pub impl Any for Double with __neg__(self) {
  -self
}

///|
pub impl Any for Bool with __neg__(self) {
  !self
}

///|
pub impl Any for Int16 with __neg__(self) {
  -self
}

///|
pub impl Any for Int with __neg__(self) {
  -self
}

///|
pub impl Any for Int64 with __neg__(self) {
  -self
}

///|
pub impl Any for BigInt with __neg__(self) {
  -self
}

///|
pub impl Any for Char with __neg__(self) {
  -number(self)
}

///|
pub impl Any for String with __neg__(self) {
  -number(self)
}

///|
pub impl Any for Array[&Any] with __eq__(self, other) {
  number(self) == number(other)
}

///|
pub impl Any for FixedArray[&Any] with __eq__(self, other) {
  number(self) == number(other)
}

///|
pub impl Any for Bool with __eq__(self, other) {
  match other.__type__() {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) == number(other)
    _ => false
  }
}

///|
pub impl Any for Double with __eq__(self, other) {
  match other.__type__() {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) == number(other)
    _ => false
  }
}

///|
pub impl Any for Float with __eq__(self, other) {
  match other.__type__() {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) == number(other)
    _ => false
  }
}

///|
pub impl Any for Int16 with __eq__(self, other) {
  match other.__type__() {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) == number(other)
    _ => false
  }
}

///|
pub impl Any for Int with __eq__(self, other) {
  match other.__type__() {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) == number(other)
    _ => false
  }
}

///|
pub impl Any for UInt16 with __eq__(self, other) {
  match other.__type__() {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) == number(other)
    _ => false
  }
}

///|
pub impl Any for UInt with __eq__(self, other) {
  match other.__type__() {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) == number(other)
    _ => false
  }
}

///|
pub impl Any for BigInt with __eq__(self, other) {
  let self_bi = self
  match Any::__type__(other) {
    "BigInt" =>
      try BigInt::from_string(@utf16.decode(&Any::__data__(other))) catch {
        Malformed(_) => false
      } noraise {
        other_bi => self_bi == other_bi
      }
    _ => false
  }
}

///|
pub impl Any for Int64 with __eq__(self, other) {
  let self_bi = BigInt::from_int64(self)
  match Any::__type__(other) {
    "BigInt" =>
      try BigInt::from_string(@utf16.decode(&Any::__data__(other))) catch {
        Malformed(_) => false
      } noraise {
        other_bi => self_bi == other_bi
      }
    _ => false
  }
}

///|
pub impl Any for UInt64 with __eq__(self, other) {
  let self_bi = BigInt::from_uint64(self)
  match Any::__type__(other) {
    "BigInt" =>
      try BigInt::from_string(@utf16.decode(&Any::__data__(other))) catch {
        Malformed(_) => false
      } noraise {
        other_bi => self_bi == other_bi
      }
    _ => false
  }
}

///|
pub impl Any for Char with __eq__(self, other) {
  self.to_string() == Any::__str__(other)
}

///|
pub impl Any for String with __eq__(self, other) {
  self == Any::__str__(other)
}

///|
pub impl Any for Array[&Any] with __ge__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) >= number(other)
    _ => false
  }
}

///|
pub impl Any for FixedArray[&Any] with __ge__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) >= number(other)
    _ => false
  }
}

///|
pub impl Any for Bool with __ge__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) >= number(other)
    _ => false
  }
}

///|
pub impl Any for Int16 with __ge__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) >= number(other)
    _ => false
  }
}

///|
pub impl Any for Int with __ge__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) >= number(other)
    _ => false
  }
}

///|
pub impl Any for UInt16 with __ge__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) >= number(other)
    _ => false
  }
}

///|
pub impl Any for UInt with __ge__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) >= number(other)
    _ => false
  }
}

///|
pub impl Any for BigInt with __ge__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let self_bi = BigInt::from_string(Any::__str__(self))
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi >= other_bi
    }
    _ => false
  }
}

///|
pub impl Any for Int64 with __ge__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let self_bi = BigInt::from_string(Any::__str__(self))
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi >= other_bi
    }
    _ => false
  }
}

///|
pub impl Any for UInt64 with __ge__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let self_bi = BigInt::from_string(Any::__str__(self))
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi >= other_bi
    }
    _ => false
  }
}

///|
pub impl Any for Char with __ge__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) >= number(other)
    _ => false
  }
}

///|
pub impl Any for String with __ge__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) >= number(other)
    _ => false
  }
}

///|
pub impl Any for Array[&Any] with __gt__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) > number(other)
    _ => false
  }
}

///|
pub impl Any for FixedArray[&Any] with __gt__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) > number(other)
    _ => false
  }
}

///|
pub impl Any for Bool with __gt__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) > number(other)
    _ => false
  }
}

///|
pub impl Any for Int16 with __gt__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) > number(other)
    _ => false
  }
}

///|
pub impl Any for Int with __gt__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) > number(other)
    _ => false
  }
}

///|
pub impl Any for UInt16 with __gt__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) > number(other)
    _ => false
  }
}

///|
pub impl Any for UInt with __gt__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) > number(other)
    _ => false
  }
}

///|
pub impl Any for BigInt with __gt__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let self_bi = BigInt::from_string(Any::__str__(self))
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi > other_bi
    }
    _ => false
  }
}

///|
pub impl Any for Int64 with __gt__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let self_bi = BigInt::from_string(Any::__str__(self))
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi > other_bi
    }
    _ => false
  }
}

///|
pub impl Any for UInt64 with __gt__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let self_bi = BigInt::from_string(Any::__str__(self))
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi > other_bi
    }
    _ => false
  }
}

///|
pub impl Any for Char with __gt__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) > number(other)
    _ => false
  }
}

///|
pub impl Any for String with __gt__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) > number(other)
    _ => false
  }
}

///|
pub impl Any for Array[&Any] with __le__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) <= number(other)
    _ => false
  }
}

///|
pub impl Any for FixedArray[&Any] with __le__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) <= number(other)
    _ => false
  }
}

///|
pub impl Any for Bool with __le__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) <= number(other)
    _ => false
  }
}

///|
pub impl Any for Int16 with __le__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) <= number(other)
    _ => false
  }
}

///|
pub impl Any for Int with __le__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) <= number(other)
    _ => false
  }
}

///|
pub impl Any for UInt16 with __le__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) <= number(other)
    _ => false
  }
}

///|
pub impl Any for UInt with __le__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) <= number(other)
    _ => false
  }
}

///|
pub impl Any for BigInt with __le__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let self_bi = BigInt::from_string(Any::__str__(self))
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi <= other_bi
    }
    _ => false
  }
}

///|
pub impl Any for Int64 with __le__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let self_bi = BigInt::from_string(Any::__str__(self))
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi <= other_bi
    }
    _ => false
  }
}

///|
pub impl Any for UInt64 with __le__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let self_bi = BigInt::from_string(Any::__str__(self))
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi <= other_bi
    }
    _ => false
  }
}

///|
pub impl Any for Char with __le__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) <= number(other)
    _ => false
  }
}

///|
pub impl Any for String with __le__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) <= number(other)
    _ => false
  }
}

///|
pub impl Any for Array[&Any] with __lt__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) < number(other)
    _ => false
  }
}

///|
pub impl Any for FixedArray[&Any] with __lt__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) < number(other)
    _ => false
  }
}

///|
pub impl Any for Bool with __lt__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) < number(other)
    _ => false
  }
}

///|
pub impl Any for Int16 with __lt__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) < number(other)
    _ => false
  }
}

///|
pub impl Any for Int with __lt__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) < number(other)
    _ => false
  }
}

///|
pub impl Any for UInt16 with __lt__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) < number(other)
    _ => false
  }
}

///|
pub impl Any for UInt with __lt__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) < number(other)
    _ => false
  }
}

///|
pub impl Any for BigInt with __lt__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let self_bi = BigInt::from_string(Any::__str__(self))
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi < other_bi
    }
    _ => false
  }
}

///|
pub impl Any for Int64 with __lt__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let self_bi = BigInt::from_string(Any::__str__(self))
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi < other_bi
    }
    _ => false
  }
}

///|
pub impl Any for UInt64 with __lt__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let self_bi = BigInt::from_string(Any::__str__(self))
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi < other_bi
    }
    _ => false
  }
}

///|
pub impl Any for Char with __lt__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) < number(other)
    _ => false
  }
}

///|
pub impl Any for String with __lt__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      number(self) < number(other)
    _ => false
  }
}

///|
/// Implement Any trait for type Bool.
/// Directly use Bool itself as the result of __bool__ method.
pub impl Any for Bool with __bool__(self) {
  self
}

///|
/// Implement Any trait for type Double.
/// Non-zero floating point is True.
pub impl Any for Double with __bool__(self) {
  self != 0
}

///|
/// Implement Any trait for type Float.
/// Non-zero floating point is True.
pub impl Any for Float with __bool__(self) {
  self != 0
}

///|
/// Implement Any trait for type Int16.
/// Non-zero Int is True.
pub impl Any for Int16 with __bool__(self) {
  self != 0
}

///|
/// Implement Any trait for type Int.
/// Non-zero Int is True.
pub impl Any for Int with __bool__(self) {
  self != 0
}

///|
/// Implement Any trait for type UInt16.
/// Non-zero Int is true
pub impl Any for UInt16 with __bool__(self) {
  self != 0
}

///|
/// Implement Any trait for type UInt.
/// Non-zero UInt is True.
pub impl Any for UInt with __bool__(self) {
  self > 0
}

///|
/// Implement Any trait for type BigInt.
/// Non-zero BigInt is True.
pub impl Any for BigInt with __bool__(self) {
  self != 0
}

///|
/// Implement Any trait for type Int64.
/// Non-zero Int64 is True.
pub impl Any for Int64 with __bool__(self) {
  self != 0
}

///|
/// Implement Any trait for type UInt64.
/// Non-zero UInt64 is True.
pub impl Any for UInt64 with __bool__(self) {
  self > 0
}

///|
/// Implement Any trait for type Char.
/// Char is String with single Char which non-empty, so always return true.
pub impl Any for Char with __bool__(_) {
  true
}

///|
/// Implement Any trait for type String.
/// Non empty String is True.
pub impl Any for String with __bool__(self) {
  !self.is_empty()
}

///|
/// Implement Any trait for type Byte.
/// Byte is Bytes with single Byte which always non-empty, so return true.
pub impl Any for Byte with __bool__(_) {
  true
}

///|
/// Implement Any trait for type Bytes.
/// Only non-empty Bytes is True. An empty Bytes is False.
pub impl Any for Bytes with __bool__(self) {
  self.length() > 0
}

///|
/// Implement Any trait for type FixedArray[&Any].
/// Non empty FixedArray is True.
pub impl Any for FixedArray[&Any] with __bool__(self) {
  !self.is_empty()
}

///|
/// Implement Any trait for type Array[&Any].
/// Non empty Array is True.
pub impl Any for Array[&Any] with __bool__(self) {
  !self.is_empty()
}

///|
/// Implement Any trait for type Json.
/// Empty Json or Json that has no content is False.
pub impl Any for Json with __bool__(self) {
  let str = self.stringify()
  !str.is_blank() || str == "{}"
}

///|
pub impl Any for Bool with __str__(self) {
  if self {
    "true"
  } else {
    "false"
  }
}

///|
pub impl Any for Double with __str__(self) {
  self.to_string()
}

///|
pub impl Any for Float with __str__(self) {
  self.to_double().to_string()
}

///|
pub impl Any for Int16 with __str__(self) {
  self.to_int().to_double().to_string()
}

///|
pub impl Any for Int with __str__(self) {
  self.to_double().to_string()
}

///|
pub impl Any for UInt16 with __str__(self) {
  self.to_int().to_double().to_string()
}

///|
pub impl Any for UInt with __str__(self) {
  self.to_double().to_string()
}

///|
pub impl Any for BigInt with __str__(self) {
  self.to_string()
}

///|
pub impl Any for Int64 with __str__(self) {
  self.to_string()
}

///|
pub impl Any for UInt64 with __str__(self) {
  self.to_string()
}

///|
pub impl Any for Char with __str__(self) {
  self.to_string()
}

///|
pub impl Any for String with __str__(self) {
  self
}

///|
pub impl Any for Array[&Any] with __str__(self) {
  match self.length() {
    0 => ""
    1 =>
      match Any::__type__(self[0]) {
        "Null" | "Undefined" => ""
        _ => Any::__str__(self[0])
      }
    _ => {
      let sb = StringBuilder::new()
      for i = 0; i < self.length() - 1; i = i + 1 {
        match Any::__type__(self[0]) {
          "Null" | "Undefined" => sb.write_stringview("")
          _ => sb.write_stringview(Any::__str__(self[0]))
        }
        sb.write_stringview(",")
      }
      match Any::__type__(self[self.length() - 1]) {
        "Null" | "Undefined" => sb.write_stringview("")
        _ => sb.write_stringview(Any::__str__(self[self.length() - 1]))
      }
      sb.to_string()
    }
  }
}

///|
pub impl Any for FixedArray[&Any] with __str__(self) {
  match self.length() {
    0 => ""
    1 =>
      match Any::__type__(self[0]) {
        "Null" | "Undefined" => ""
        _ => Any::__str__(self[0])
      }
    _ => {
      let sb = StringBuilder::new()
      for i = 0; i < self.length() - 1; i = i + 1 {
        match Any::__type__(self[0]) {
          "Null" | "Undefined" => sb.write_stringview("")
          _ => sb.write_stringview(Any::__str__(self[0]))
        }
        sb.write_stringview(",")
      }
      match Any::__type__(self[self.length() - 1]) {
        "Null" | "Undefined" => sb.write_stringview("")
        _ => sb.write_stringview(Any::__str__(self[self.length() - 1]))
      }
      sb.to_string()
    }
  }
}

///|
pub impl Any for Byte with __str__(self) {
  self.to_int().to_char().to_string()
}

///|
pub impl Any for Bytes with __str__(self) {
  try @utf16.decode(self) catch {
    Malformed(_) => {
      let sb = StringBuilder::new()
      for b in self {
        sb.write_stringview(b.to_hex())
      }
      sb.to_string()
    }
  } noraise {
    str => str
  }
}

///|
pub impl Any for Json with __str__(self) {
  self.stringify()
}

///|
/// Parse Array, Boolean, Number, String and Null type to Double.
pub fn number(any : &Any) -> Double {
  match Any::__type__(any) {
    "Array" | "String" => {
      let str = Any::__str__(any)
      if str.is_blank() {
        0.0
      } else {
        try @strconv.parse_double(str) catch {
          StrConvError(_) => @double.not_a_number
        } noraise {
          d => d
        }
      }
    }
    "Boolean" | "Number" =>
      Any::__data__(any).unsafe_read_uint64_le(0).reinterpret_as_double()
    "Null" => 0.0
    _ => @double.not_a_number
  }
}
