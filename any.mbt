///| Any trait: 定义通用值（Any）的抽象接口。

///|
/// 包含获取类型、二进制数据、字符串表示、比较、算术等通用操作的魔法方法。
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
/// 默认布尔值转换: 根据类型判断 Any 值是否视作真值（非 Null/Undefined）。
impl Any with __bool__(self) {
  Any::__type__(self) != "Null" || Any::__type__(self) != "Undefined"
}

///|
/// 默认字符串表示: 使用其二进制数据的字符串化结果作为默认 __str__。
impl Any with __str__(self) {
  Any::__str__(Any::__data__(self))
}

///|
/// 默认相等比较: 通过比较 __data__ 的字节表示判断相等性。
impl Any with __eq__(self, other) {
  Any::__data__(self) == Any::__data__(other)
}

///|
/// 默认二元算术/一元取反操作: 未定义的组合会返回 `Undefined`（占位实现）。
impl Any with __add__(_, _) {
  Undefined::{  }
}

///|
/// 默认二元算术/一元取反操作: 未定义的组合会返回 `Undefined`（占位实现）。
impl Any with __sub__(_, _) {
  Undefined::{  }
}

///|
/// 默认二元算术/一元取反操作: 未定义的组合会返回 `Undefined`（占位实现）。
impl Any with __mul__(_, _) {
  Undefined::{  }
}

///|
/// 默认二元算术/一元取反操作: 未定义的组合会返回 `Undefined`（占位实现）。
impl Any with __div__(_, _) {
  Undefined::{  }
}

///|
/// 默认二元算术/一元取反操作: 未定义的组合会返回 `Undefined`（占位实现）。
impl Any with __neg__(_) {
  Undefined::{  }
}

///|
/// 默认比较接口: 未指定的比较返回中立值或 false，子类型可重写以提供真实比较行为。
impl Any with __compare__(_, _) {
  0
}

///|
/// 默认大于等于: 基本实现返回 false，具体类型根据需要覆盖。
impl Any with __ge__(_, _) {
  false
}

///|
/// 默认大于: 基本实现返回 false，具体类型根据需要覆盖。
impl Any with __gt__(_, _) {
  false
}

///|
/// 默认小于等于: 基本实现返回 false，具体类型根据需要覆盖。
impl Any with __le__(_, _) {
  false
}

///|
/// 默认小于: 基本实现返回 false，具体类型根据需要覆盖。
impl Any with __lt__(_, _) {
  false
}

///|
/// 默认哈希: 基于 __data__ 的字节内容计算哈希值。
impl Any with __hash__(self) {
  Any::__data__(self).hash()
}

// Implement overloaded operator for Any trait

///|
/// 运算符重载适配器: 将 `Any` 的魔法方法映射为通用的算术/比较/布尔运算符实现。
pub impl Add for &Any with add(self, other) {
  Any::__add__(self, other)
}

///|
/// 运算符重载适配器: 将 `Any` 的魔法方法映射为通用的算术/比较/布尔运算符实现。
pub impl Sub for &Any with sub(self, other) {
  Any::__sub__(self, other)
}

///|
/// 运算符重载适配器: 将 `Any` 的魔法方法映射为通用的算术/比较/布尔运算符实现。
pub impl Mul for &Any with mul(self, other) {
  Any::__mul__(self, other)
}

///|
/// 运算符重载适配器: 将 `Any` 的魔法方法映射为通用的算术/比较/布尔运算符实现。
pub impl Div for &Any with div(self, other) {
  Any::__div__(self, other)
}

///|
/// 运算符重载适配器: 将 `Any` 的魔法方法映射为通用的算术/比较/布尔运算符实现。
pub impl Neg for &Any with neg(self) {
  Any::__neg__(self)
}

///|
/// 运算符重载适配器: 将 `Any` 的魔法方法映射为通用的算术/比较/布尔运算符实现。
pub impl Eq for &Any with equal(self, other) {
  Any::__eq__(self, other)
}

///|
/// 运算符重载适配器: 将 `Any` 的魔法方法映射为通用的算术/比较/布尔运算符实现。
pub impl Compare for &Any with compare(self, other) {
  Any::__compare__(self, other)
}

///|
/// 运算符重载适配器: 将 `Any` 的魔法方法映射为通用的算术/比较/布尔运算符实现。
pub impl Compare for &Any with op_ge(self, other) {
  Any::__ge__(self, other)
}

///|
/// 运算符重载适配器: 将 `Any` 的魔法方法映射为通用的算术/比较/布尔运算符实现。
pub impl Compare for &Any with op_gt(self, other) {
  Any::__gt__(self, other)
}

///|
/// 运算符重载适配器: 将 `Any` 的魔法方法映射为通用的算术/比较/布尔运算符实现。
pub impl Compare for &Any with op_le(self, other) {
  Any::__le__(self, other)
}

///|
/// 运算符重载适配器: 将 `Any` 的魔法方法映射为通用的算术/比较/布尔运算符实现。
pub impl Compare for &Any with op_lt(self, other) {
  Any::__lt__(self, other)
}

// Implement hash for Any trait.

///|
/// Hash/Show 适配: 将 Any 的哈希与展示方法映射到通用接口。
pub impl Hash for &Any with hash(self) {
  Any::__hash__(self)
}

///|
/// Hash/Show 适配: 将 Any 的哈希与展示方法映射到通用接口。
pub impl Hash for &Any with hash_combine(self, hasher) {
  hasher.combine(Any::__data__(self))
}

///|
/// Hash/Show 适配: 将 Any 的哈希与展示方法映射到通用接口。
pub impl Show for &Any with to_string(self) {
  Any::__str__(self)
}

///|
/// Hash/Show 适配: 将 Any 的哈希与展示方法映射到通用接口。
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
/// `__type__` 实现：将 `Double` 视为通用类型 `Number`。
pub impl Any for Double with __type__(_) {
  "Number"
}

///|
/// `__type__` 实现：将 `Float` 视为通用类型 `Number`。
pub impl Any for Float with __type__(_) {
  "Number"
}

///|
/// `__type__` 实现：将 `Int16` 视为通用类型 `Number`。
pub impl Any for Int16 with __type__(_) {
  "Number"
}

///|
/// `__type__` 实现：将 `Int` 视为通用类型 `Number`。
pub impl Any for Int with __type__(_) {
  "Number"
}

///|
/// `__type__` 实现：将 `UInt16` 视为通用类型 `Number`。
pub impl Any for UInt16 with __type__(_) {
  "Number"
}

///|
/// `__type__` 实现：将 `UInt` 视为通用类型 `Number`。
pub impl Any for UInt with __type__(_) {
  "Number"
}

///|
/// `__type__` 实现：将 `BigInt` 标记为 `BigInt` 类型，用于大整数运算。
pub impl Any for BigInt with __type__(_) {
  "BigInt"
}

///|
/// `__type__` 实现：将 `Int64` 视为 `BigInt`（用于大整数语义）。
pub impl Any for Int64 with __type__(_) {
  "BigInt"
}

///|
/// `__type__` 实现：将 `UInt64` 视为 `BigInt`（用于大整数语义）。
pub impl Any for UInt64 with __type__(_) {
  "BigInt"
}

///|
/// `__type__` 实现：将 `Byte` 归为 `Bytes`（单字节数组）。
pub impl Any for Byte with __type__(_) {
  "Bytes"
}

///|
/// `__type__` 实现：`Bytes` 对应二进制数据类型 `Bytes`。
pub impl Any for Bytes with __type__(_) {
  "Bytes"
}

///|
/// `__type__` 实现：`Char` 作为单字符字符串，类型标记为 `String`。
pub impl Any for Char with __type__(_) {
  "String"
}

///|
/// `__type__` 实现：`String` 的类型标记为 `String`。
pub impl Any for String with __type__(_) {
  "String"
}

///|
/// `__type__` 实现：`Array[&Any]` 的类型标记为 `Array`。
pub impl Any for Array[&Any] with __type__(_) {
  "Array"
}

///|
/// `__type__` 实现：`FixedArray[&Any]` 的类型标记为 `Array`（定长数组）。
pub impl Any for FixedArray[&Any] with __type__(_) {
  "Array"
}

///|
/// `__type__` 实现：`Unit` 被视为 `Void`（无值）。
pub impl Any for Unit with __type__(_) {
  "Void"
}

///|
/// `__type__` 实现：`Json` 的类型标记为 `Struct`（结构化数据）。
pub impl Any for Json with __type__(_) {
  "Struct"
}

///| 将 `Bool` 序列化为 `__data__` 的二进制表示。

///|
/// 使用 8 字节 double 的低位写入 1 或 0，便于与数值类型统一处理。
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
/// 将 `Double`（双精度浮点）直接写入 8 字节 little-endian 表示，作为 `__data__`。
pub impl Any for Double with __data__(self) {
  let buf = @buffer.new(size_hint=8)
  buf.write_double_le(self)
  buf.contents()
}

///|
/// 将 `Float`（单精度）提升为 double 后写入，统一为 8 字节 double 表示。
pub impl Any for Float with __data__(self) {
  let buf = @buffer.new(size_hint=8)
  buf.write_double_le(self.to_double())
  buf.contents()
}

///|
/// 将 `Int16` 转为 double 写入 8 字节表示，便于数值统一处理。
pub impl Any for Int16 with __data__(self) {
  let buf = @buffer.new(size_hint=8)
  buf.write_double_le(self.to_int().to_double())
  buf.contents()
}

///|
/// 将 `Int` 转为 double 写入 8 字节表示，便于数值统一处理。
pub impl Any for Int with __data__(self) {
  let buf = @buffer.new(size_hint=8)
  buf.write_double_le(self.to_double())
  buf.contents()
}

///|
/// 将 `UInt16` 转为 double 写入 8 字节表示，便于数值统一处理。
pub impl Any for UInt16 with __data__(self) {
  let buf = @buffer.new(size_hint=8)
  buf.write_double_le(self.to_uint().to_double())
  buf.contents()
}

///|
/// 将 `UInt` 转为 double 写入 8 字节表示，便于数值统一处理。
pub impl Any for UInt with __data__(self) {
  let buf = @buffer.new(size_hint=8)
  buf.write_double_le(self.to_double())
  buf.contents()
}

///|
/// 将 `BigInt` 序列化为 UTF-16LE 编码的字符串表示，作为 `__data__`。
pub impl Any for BigInt with __data__(self) {
  let buf = @buffer.new()
  buf.write_string_utf16le(self.to_string())
  buf.contents()
}

///|
/// 将 `Int64` 先转换为 `BigInt`，再写为 UTF-16LE 的字符串表示作为 `__data__`。
pub impl Any for Int64 with __data__(self) {
  let buf = @buffer.new()
  buf.write_string_utf16le(BigInt::from_int64(self).to_string())
  buf.contents()
}

///|
/// 将 `UInt64` 先转换为 `BigInt`，再写为 UTF-16LE 的字符串表示作为 `__data__`。
pub impl Any for UInt64 with __data__(self) {
  let buf = @buffer.new()
  buf.write_string_utf16le(BigInt::from_uint64(self).to_string())
  buf.contents()
}

///|
/// 将单个 `Byte` 包装为长度为 1 的 `Bytes`（字节数组）。
pub impl Any for Byte with __data__(self) {
  [self]
}

///|
/// `Bytes` 的 `__data__` 直接返回自身二进制数据。
pub impl Any for Bytes with __data__(self) {
  self
}

///|
/// 将 `Char` 写为 UTF-16LE 字符串形式的二进制数据。
pub impl Any for Char with __data__(self) {
  let buf = @buffer.new()
  buf.write_string_utf16le(self.to_string())
  buf.contents()
}

///|
/// 将 `String` 写为 UTF-16LE 编码的二进制数据作为 `__data__`。
pub impl Any for String with __data__(self) {
  let buf = @buffer.new()
  buf.write_string_utf16le(self)
  buf.contents()
}

///|
/// 将 `Array[&Any]` 的每个元素的 `__data__` 依次拼接，作为数组整体的二进制表示。
pub impl Any for Array[&Any] with __data__(self) {
  let buf = @buffer.new()
  for a in self {
    buf.write_bytes(a.__data__())
  }
  buf.contents()
}

///|
/// 将 `FixedArray[&Any]` 的每个元素的 `__data__` 依次拼接，作为定长数组的二进制表示。
pub impl Any for FixedArray[&Any] with __data__(self) {
  let buf = @buffer.new()
  for a in self {
    buf.write_bytes(a.__data__())
  }
  buf.contents()
}

///|
/// `Unit` 没有数据，返回空的 `Bytes`。
pub impl Any for Unit with __data__(_) {
  Bytes::new(0)
}

///|
/// 将 `Json` 对象的字符串化表示（`stringify()`）写为 UTF-16LE，作为二进制数据。
pub impl Any for Json with __data__(self) {
  let buf = @buffer.new()
  buf.write_string_utf16le(self.stringify())
  buf.contents()
}

///|
/// `__add__`（加法/拼接）实现：数组与其他值相加时，按字符串表示拼接。
pub impl Any for Array[&Any] with __add__(self, other) {
  (Any::__str__(self) + Any::__str__(other)) as &Any
}

///|
/// `__add__`（加法/拼接）实现：定长数组与其他值相加时，按字符串表示拼接。
pub impl Any for FixedArray[&Any] with __add__(self, other) {
  (Any::__str__(self) + Any::__str__(other)) as &Any
}

///| 数值与字符串混合的 `__add__`：遇到 `Array`/`String` 则拼接数组/字符串，

///|
/// 将非数值类型转换为数值后相加；`BigInt` 返回未定义错误。
pub impl Any for Bool with __add__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => (Any::__str__(self) + Any::__str__(other)) as &Any
    "Boolean" | "Number" | "Null" => number(self) + number(other)
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相加；`BigInt` 返回未定义错误。
pub impl Any for Double with __add__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => (Any::__str__(self) + Any::__str__(other)) as &Any
    "Boolean" | "Number" | "Null" => number(self) + number(other)
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相加；`BigInt` 返回未定义错误。
pub impl Any for Float with __add__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => (Any::__str__(self) + Any::__str__(other)) as &Any
    "Boolean" | "Number" | "Null" => number(self) + number(other)
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相加；`BigInt` 返回未定义错误。
pub impl Any for Int16 with __add__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => (Any::__str__(self) + Any::__str__(other)) as &Any
    "Boolean" | "Number" | "Null" => number(self) + number(other)
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相加；`BigInt` 返回未定义错误。
pub impl Any for Int with __add__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => (Any::__str__(self) + Any::__str__(other)) as &Any
    "Boolean" | "Number" | "Null" => number(self) + number(other)
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相加；`BigInt` 返回未定义错误。
pub impl Any for UInt16 with __add__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => (Any::__str__(self) + Any::__str__(other)) as &Any
    "Boolean" | "Number" | "Null" => number(self) + number(other)
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相加；`BigInt` 返回未定义错误。
pub impl Any for UInt with __add__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => (Any::__str__(self) + Any::__str__(other)) as &Any
    "Boolean" | "Number" | "Null" => number(self) + number(other)
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// `BigInt` 的 `__add__`：支持与另一个 `BigInt` 的加法（通过解析对方的 `__data__`），
/// 或与字符串/数组拼接为字符串；其他类型返回 `Undefined`。
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
/// `Int64` 的 `__add__`：将自身视为 `BigInt`，支持与另一个 `BigInt` 的加法（通过解析对方的 `__data__`），
/// 或与字符串/数组拼接为字符串；其他类型返回 `Undefined`。
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
/// `UInt64` 的 `__add__`：将自身视为 `BigInt`，支持与另一个 `BigInt` 的加法（通过解析对方的 `__data__`），
/// 或与字符串/数组拼接为字符串；其他类型返回 `Undefined`。
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
/// `Byte` 的 `__add__`：对字节执行拼接，返回合并后的 `Bytes`。
pub impl Any for Byte with __add__(self, other) {
  Any::__data__(self) + Any::__data__(other)
}

///|
/// `Bytes` 的 `__add__`：连接两个字节数组。
pub impl Any for Bytes with __add__(self, other) {
  Any::__data__(self) + Any::__data__(other)
}

///|
/// `Char` 的 `__add__`：按字符串拼接。
pub impl Any for Char with __add__(self, other) {
  Any::__str__(self) + Any::__str__(other)
}

///|
/// `String` 的 `__add__`：按字符串拼接。
pub impl Any for String with __add__(self, other) {
  Any::__str__(self) + Any::__str__(other)
}

///|
/// 将非数值类型转换为数值后相减；`BigInt` 返回未定义错误。
pub impl Any for Array[&Any] with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相减；`BigInt` 返回未定义错误。
pub impl Any for FixedArray[&Any] with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相减；`BigInt` 返回未定义错误。
pub impl Any for Bool with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相减；`BigInt` 返回未定义错误。
pub impl Any for Double with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相减；`BigInt` 返回未定义错误。
pub impl Any for Float with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相减；`BigInt` 返回未定义错误。
pub impl Any for Int16 with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相减；`BigInt` 返回未定义错误。
pub impl Any for Int with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相减；`BigInt` 返回未定义错误。
pub impl Any for UInt16 with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相减；`BigInt` 返回未定义错误。
pub impl Any for UInt with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// `BigInt`仅支持与另一个 `BigInt` 相减（解析对方 `__data__`）。
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
/// 将自身视为 `BigInt` 与对方 `BigInt` 相减。
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
/// 将自身视为 `BigInt` 与对方 `BigInt` 相减。
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
/// 将非数值类型转换为数值后相减；`BigInt` 返回未定义错误。
pub impl Any for Char with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相减；`BigInt` 返回未定义错误。
pub impl Any for String with __sub__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) - number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相乘；`BigInt` 返回未定义错误。
pub impl Any for Array[&Any] with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相乘；`BigInt` 返回未定义错误。
pub impl Any for FixedArray[&Any] with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相乘；`BigInt` 返回未定义错误。
pub impl Any for Bool with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相乘；`BigInt` 返回未定义错误。
pub impl Any for Double with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相乘；`BigInt` 返回未定义错误。
pub impl Any for Float with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相乘；`BigInt` 返回未定义错误。
pub impl Any for Int16 with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相乘；`BigInt` 返回未定义错误。
pub impl Any for Int with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相乘；`BigInt` 返回未定义错误。
pub impl Any for UInt16 with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相乘；`BigInt` 返回未定义错误。
pub impl Any for UInt with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// `BigInt`支持与另一个 `BigInt` 的乘法（解析对方 `__data__`），失败返回 `Undefined`。
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
/// 将自身视为 `BigInt` 与对方 `BigInt` 相乘。
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
/// 将自身视为 `BigInt` 与对方 `BigInt` 相乘。
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
/// 将非数值类型转换为数值后相乘；`BigInt` 返回未定义错误。
pub impl Any for Char with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相乘；`BigInt` 返回未定义错误。
pub impl Any for String with __mul__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) * number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相除；`BigInt` 返回未定义错误。
pub impl Any for Array[&Any] with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相除；`BigInt` 返回未定义错误。
pub impl Any for FixedArray[&Any] with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相除；`BigInt` 返回未定义错误。
pub impl Any for Bool with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相除；`BigInt` 返回未定义错误。
pub impl Any for Double with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相除；`BigInt` 返回未定义错误。
pub impl Any for Float with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相除；`BigInt` 返回未定义错误。
pub impl Any for Int16 with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相除；`BigInt` 返回未定义错误。
pub impl Any for Int with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相除；`BigInt` 返回未定义错误。
pub impl Any for UInt16 with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相除；`BigInt` 返回未定义错误。
pub impl Any for UInt with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// `BigInt` 的 `__div__`：解析对方 `__data__` 为字符串后转换为 BigInt 并执行除法。
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
/// `Int64` 的 `__div__`：将自身视作 BigInt 并与对方 BigInt 相除。
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
/// `UInt64` 的 `__div__`：将自身视作 BigInt 并与对方 BigInt 相除。
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
/// 将非数值类型转换为数值后相除；`BigInt` 返回未定义错误。
pub impl Any for Char with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 将非数值类型转换为数值后相除；`BigInt` 返回未定义错误。
pub impl Any for String with __div__(self, other) {
  match Any::__type__(other) {
    "Array" | "Boolean" | "Number" | "String" | "Null" =>
      (number(self) / number(other)) as &Any
    "BigInt" => Undefined::{  }
    _ => @double.not_a_number
  }
}

///|
/// 按数值语义取反（非数值类型先转换为数值）。
pub impl Any for Array[&Any] with __neg__(self) {
  -number(self)
}

///|
/// 按数值语义取反（非数值类型先转换为数值）。
pub impl Any for FixedArray[&Any] with __neg__(self) {
  -number(self)
}

///|
/// 按数值语义取反（非数值类型先转换为数值）。
pub impl Any for Float with __neg__(self) {
  -self.to_double()
}

///|
/// 按数值语义取反（非数值类型先转换为数值）。
pub impl Any for Double with __neg__(self) {
  -self
}

///|
/// 逻辑取反。
pub impl Any for Bool with __neg__(self) {
  !self
}

///|
/// 按数值语义取反（非数值类型先转换为数值）。
pub impl Any for Int16 with __neg__(self) {
  -self.to_int().to_double()
}

///|
/// 按数值语义取反（非数值类型先转换为数值）。
pub impl Any for Int with __neg__(self) {
  -self.to_double()
}

///|
/// 将自身视为BigInt进行取反。
pub impl Any for Int64 with __neg__(self) {
  BigInt::from_int64(-self)
}

///|
/// 按数值语义取反（非数值类型先转换为数值）。
pub impl Any for UInt16 with __neg__(self) {
  -self.to_uint().to_double()
}

///|
/// 按数值语义取反（非数值类型先转换为数值）。
pub impl Any for UInt with __neg__(self) {
  -self.to_double()
}

///|
/// 将自身视为BigInt进行取反。
pub impl Any for UInt64 with __neg__(self) {
  -BigInt::from_uint64(self)
}

///|
/// `__neg__`（一元取反/取反）实现：大整数取反（BigInt）。
pub impl Any for BigInt with __neg__(self) {
  -self
}

///|
/// 按数值语义取反（非数值类型先转换为数值）。
pub impl Any for Char with __neg__(self) {
  -number(self)
}

///|
/// 按数值语义取反（非数值类型先转换为数值）。
pub impl Any for String with __neg__(self) {
  -number(self)
}

///|
/// 若另一个值为数值则按数值语义比较（先转换为 number）；
/// 若是数组或字符串则按字符串比较（先转换为String）。
pub impl Any for Array[&Any] with __compare__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" =>
      compare_string(Any::__str__(self), Any::__str__(other))
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      -compare_bigint_and_number(other_bi, number(self))
    }
    _ => number(self).compare(number(other))
  }
}

///|
/// 若另一个值为数值则按数值语义比较（先转换为 number）；
/// 若是数组或字符串则按字符串比较（先转换为String）。
pub impl Any for FixedArray[&Any] with __compare__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" =>
      compare_string(Any::__str__(self), Any::__str__(other))
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      -compare_bigint_and_number(other_bi, number(self))
    }
    _ => number(self).compare(number(other))
  }
}

///|
/// 按数值语义比较（先转换为 number）。
pub impl Any for Bool with __compare__(self, other) {
  let self_num = if self { 1.0 } else { 0.0 }
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      -compare_bigint_and_number(other_bi, number(self))
    }
    _ => self_num.compare(number(other))
  }
}

///|
/// 按数值语义比较（先转换为 number）。
pub impl Any for Double with __compare__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      -compare_bigint_and_number(other_bi, self)
    }
    _ => self.compare(number(other))
  }
}

///|
/// 按数值语义比较（先转换为 number）。
pub impl Any for Float with __compare__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      -compare_bigint_and_number(other_bi, self.to_double())
    }
    _ => self.to_double().compare(number(other))
  }
}

///|
/// 按数值语义比较（先转换为 number）。
pub impl Any for Int16 with __compare__(self, other) {
  match Any::__type__(other) {
    "BigInt" =>
      -BigInt::from_string(Any::__str__(other)).compare_int(self.to_int())
    _ => self.to_int().to_double().compare(number(other))
  }
}

///|
/// 按数值语义比较（先转换为 number）。
pub impl Any for Int with __compare__(self, other) {
  match Any::__type__(other) {
    "BigInt" => -BigInt::from_string(Any::__str__(other)).compare_int(self)
    _ => self.to_double().compare(number(other))
  }
}

///|
/// 按数值语义比较（先转换为 number）。
pub impl Any for UInt16 with __compare__(self, other) {
  match Any::__type__(other) {
    "BigInt" =>
      -BigInt::from_string(Any::__str__(other)).compare_int(self.to_int())
    _ => self.to_int().to_double().compare(number(other))
  }
}

///|
/// 按数值语义比较（先转换为 number）。
pub impl Any for UInt with __compare__(self, other) {
  match Any::__type__(other) {
    "BigInt" =>
      -BigInt::from_string(Any::__str__(other)).compare_int64(self.to_int64())
    _ => self.to_int64().to_double().compare(number(other))
  }
}

///|
/// 与BigInt和数值类型进行比较。
pub impl Any for BigInt with __compare__(self, other) {
  match Any::__type__(other) {
    "BigInt" => self.compare(BigInt::from_string(Any::__str__(other)))
    _ => compare_bigint_and_number(self, number(other))
  }
}

///|
/// 与BigInt和数值类型进行比较。
pub impl Any for Int64 with __compare__(self, other) {
  match Any::__type__(other) {
    "BigInt" =>
      BigInt::from_int64(self).compare(BigInt::from_string(Any::__str__(other)))
    _ => compare_bigint_and_number(BigInt::from_int64(self), number(other))
  }
}

///|
/// 与BigInt和数值类型进行比较。
pub impl Any for UInt64 with __compare__(self, other) {
  match Any::__type__(other) {
    "BigInt" =>
      BigInt::from_uint64(self).compare(
        BigInt::from_string(Any::__str__(other)),
      )
    _ => compare_bigint_and_number(BigInt::from_uint64(self), number(other))
  }
}

///|
pub impl Any for Char with __compare__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => compare_string(self.to_string(), Any::__str__(other))
    "BigInt" =>
      -compare_bigint_and_number(
        BigInt::from_string(Any::__str__(other)),
        number(self),
      )
    _ => number(self).compare(number(other))
  }
}

///|
pub impl Any for String with __compare__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => compare_string(self, Any::__str__(other))
    "BigInt" =>
      -compare_bigint_and_number(
        BigInt::from_string(Any::__str__(other)),
        number(self),
      )
    _ => number(self).compare(number(other))
  }
}

///|
/// 数组与数值类型按数值语义比较（先转换为 number）;
/// 与数组或字符串类型按字符串比较（转换为 String）；
/// 与BigInt比较的时候先转换为数值再比较。
pub impl Any for Array[&Any] with __eq__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => Any::__str__(self) == Any::__str__(other)
    "BigInt" => {
      let self_num = number(self)
      if self_num.is_nan() {
        false
      } else {
        let other_bi = BigInt::from_string(Any::__str__(other))
        compare_bigint_and_number(other_bi, self_num) == 0
      }
    }
    _ => number(self) == number(other)
  }
}

///|
/// 数组与数值类型按数值语义比较（先转换为 number）;
/// 与数组或字符串类型按字符串比较（转换为 String）；
/// 与BigInt比较的时候先转换为数值再比较。
pub impl Any for FixedArray[&Any] with __eq__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => Any::__str__(self) == Any::__str__(other)
    "BigInt" => {
      let self_num = number(self)
      if self_num.is_nan() {
        false
      } else {
        let other_bi = BigInt::from_string(Any::__str__(other))
        compare_bigint_and_number(other_bi, self_num) == 0
      }
    }
    _ => number(self) == number(other)
  }
}

///|
/// 布尔先转为数值后与其他基本类型按数值类型比较;
/// 遇到BigInt时转为数值再转为BigInt比较。
pub impl Any for Bool with __eq__(self, other) {
  match other.__type__() {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      let self_num = if self { 1 } else { 0 }
      other_bi.compare_int(self_num) == 0
    }
    _ => number(self) == number(other)
  }
}

///|
/// 数值类型与其它基本类型按数值比较;
/// 遇到BigInt时转为BigInt比较。
pub impl Any for Double with __eq__(self, other) {
  match other.__type__() {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      compare_bigint_and_number(other_bi, self) == 0
    }
    _ => number(self) == number(other)
  }
}

///|
/// 数值类型与其它基本类型按数值比较;
/// 遇到BigInt时转为BigInt比较。
pub impl Any for Float with __eq__(self, other) {
  match other.__type__() {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      compare_bigint_and_number(other_bi, self.to_double()) == 0
    }
    _ => number(self) == number(other)
  }
}

///|
/// 数值类型与其它基本类型按数值比较;
/// 遇到BigInt时转为BigInt比较。
pub impl Any for Int16 with __eq__(self, other) {
  match other.__type__() {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      other_bi.compare_int(self.to_int()) == 0
    }
    _ => number(self) == number(other)
  }
}

///|
/// 数值类型与其它基本类型按数值比较;
/// 遇到BigInt时转为BigInt比较。
pub impl Any for Int with __eq__(self, other) {
  match other.__type__() {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      other_bi.compare_int(self) == 0
    }
    _ => number(self) == number(other)
  }
}

///|
/// 数值类型与其它基本类型按数值比较;
/// 遇到BigInt时转为BigInt比较。
pub impl Any for UInt16 with __eq__(self, other) {
  match other.__type__() {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      other_bi.compare_int(self.to_int()) == 0
    }
    _ => number(self) == number(other)
  }
}

///|
/// 数值类型与其它基本类型按数值比较;
/// 遇到BigInt时转为BigInt比较。
pub impl Any for UInt with __eq__(self, other) {
  match other.__type__() {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      other_bi.compare_int64(self.to_int64()) == 0
    }
    _ => number(self) == number(other)
  }
}

///|
/// BigInt 与另一个 BigInt 比较;
/// 如果时数值类型则将其转换为BigInt比较；
/// 其他类型返回 false。
pub impl Any for BigInt with __eq__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      self == other_bi
    }
    _ => compare_bigint_and_number(self, number(other)) == 0
  }
}

///|
/// BigInt 与另一个 BigInt 比较，其他类型返回 false。
pub impl Any for Int64 with __eq__(self, other) {
  let self_bi = BigInt::from_int64(self)
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi == other_bi
    }
    _ => compare_bigint_and_number(self_bi, number(other)) == 0
  }
}

///|
/// BigInt 与另一个 BigInt 比较，其他类型返回 false。
pub impl Any for UInt64 with __eq__(self, other) {
  let self_bi = BigInt::from_uint64(self)
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi == other_bi
    }
    _ => compare_bigint_and_number(self_bi, number(other)) == 0
  }
}

///|
/// 字符串与数组或字符串按字符串进行比较；
/// 与数值类型转换为数值进行比较；
/// 与BigInt类型转换为数值再比较。
pub impl Any for Char with __eq__(self, other) {
  match Any::__str__(other) {
    "Array" | "String" => self.to_string() == Any::__str__(other)
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      compare_bigint_and_number(other_bi, number(self)) == 0
    }
    _ => number(self) == number(other)
  }
}

///|
/// 字符串与数组或字符串按字符串进行比较；
/// 与数值类型转换为数值进行比较；
/// 与BigInt类型转换为数值再比较。
pub impl Any for String with __eq__(self, other) {
  match Any::__str__(other) {
    "Array" | "String" => self == Any::__str__(other)
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      compare_bigint_and_number(other_bi, number(self)) == 0
    }
    _ => number(self) == number(other)
  }
}

///|
/// 数组与数值类型按数值语义比较（先转换为 number）；
/// 与BigInt先转换为数值进行比较；
/// 与数组或字符串按字符串比较。
pub impl Any for Array[&Any] with __ge__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" =>
      compare_string(Any::__str__(self), Any::__str__(other)) >= 0
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      compare_bigint_and_number(other_bi, number(self)) <= 0
    }
    _ => number(self) >= number(other)
  }
}

///|
/// 数组与数值类型按数值语义比较（先转换为 number）；
/// 与BigInt先转换为数值进行比较；
/// 与数组或字符串按字符串比较。
pub impl Any for FixedArray[&Any] with __ge__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" =>
      compare_string(Any::__str__(self), Any::__str__(other)) >= 0
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      compare_bigint_and_number(other_bi, number(self)) <= 0
    }
    _ => number(self) >= number(other)
  }
}

///|
/// 布尔先转为数值后与其他基本类型按数值类型比较；
/// 与BigInt比较时先转换为BigInt；
/// 其他类型返回false。
pub impl Any for Bool with __ge__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      compare_bigint_and_number(other_bi, if self { 1.0 } else { 0.0 }) <= 0
    }
    _ => number(self) >= number(other)
  }
}

///|
/// 数值类型与其它基本类型按数值比较；
/// 与BigInt比较时先转换为BigInt；
/// 其他类型返回 false。
pub impl Any for Int16 with __ge__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      other_bi.compare_int(self.to_int()) <= 0
    }
    _ => number(self) >= number(other)
  }
}

///|
/// 数值类型与其它基本类型按数值比较；
/// 与BigInt比较时先转换为BigInt；
/// 其他类型返回 false。
pub impl Any for Int with __ge__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      other_bi.compare_int(self) <= 0
    }
    _ => number(self) >= number(other)
  }
}

///|
/// 数值类型与其它基本类型按数值比较；
/// 与BigInt比较时先转换为BigInt；
/// 其他类型返回 false。
pub impl Any for UInt16 with __ge__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      other_bi.compare_int(self.to_int()) <= 0
    }
    _ => number(self) >= number(other)
  }
}

///|
/// 数值类型与其它基本类型按数值比较；
/// 与BigInt比较时先转换为BigInt；
/// 其他类型返回 false。
pub impl Any for UInt with __ge__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      other_bi.compare_int64(self.to_int64()) <= 0
    }
    _ => number(self) >= number(other)
  }
}

///|
/// BigInt 与另一个 BigInt 或数值类型比较，与其他类型返回 false。
pub impl Any for BigInt with __ge__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let self_bi = BigInt::from_string(Any::__str__(self))
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi >= other_bi
    }
    _ => {
      let other_num = number(other)
      if other_num.is_nan() {
        false
      } else {
        compare_bigint_and_number(self, other_num) >= 0
      }
    }
  }
}

///|
/// BigInt 与另一个 BigInt 或数值类型比较，与其他类型返回 false。
pub impl Any for Int64 with __ge__(self, other) {
  let self_bi = BigInt::from_int64(self)
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi >= other_bi
    }
    _ => {
      let other_num = number(other)
      if other_num.is_nan() {
        false
      } else {
        compare_bigint_and_number(self_bi, other_num) >= 0
      }
    }
  }
}

///|
/// BigInt 与另一个 BigInt 或数值类型比较，与其他类型返回 false。
pub impl Any for UInt64 with __ge__(self, other) {
  let self_bi = BigInt::from_uint64(self)
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi >= other_bi
    }
    _ => {
      let other_num = number(other)
      if other_num.is_nan() {
        false
      } else {
        compare_bigint_and_number(self_bi, other_num) >= 0
      }
    }
  }
}

///|
/// 若另一个值为数值则按数值语义比较（先转换为 number）；
/// 若是数组或字符串则按字符串比较（先转换为String）。
pub impl Any for Char with __ge__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" =>
      compare_string(self.to_string(), Any::__str__(other)) >= 0
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      compare_bigint_and_number(other_bi, number(self)) <= 0
    }
    _ => number(self) >= number(other)
  }
}

///|
/// 若另一个值为数值则按数值语义比较（先转换为 number）；
/// 若是数组或字符串则按字符串比较（先转换为String）。
pub impl Any for String with __ge__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => compare_string(self, Any::__str__(other)) >= 0
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      compare_bigint_and_number(other_bi, number(self)) <= 0
    }
    _ => number(self) >= number(other)
  }
}

///|
pub impl Any for Array[&Any] with __gt__(self, other) {
  Any::__compare__(self, other) > 0
}

///|
pub impl Any for FixedArray[&Any] with __gt__(self, other) {
  Any::__compare__(self, other) > 0
}

///|
pub impl Any for Bool with __gt__(self, other) {
  Any::__compare__(self, other) > 0
}

///|
pub impl Any for Int16 with __gt__(self, other) {
  Any::__compare__(self, other) > 0
}

///|
pub impl Any for Int with __gt__(self, other) {
  Any::__compare__(self, other) > 0
}

///|
pub impl Any for UInt16 with __gt__(self, other) {
  Any::__compare__(self, other) > 0
}

///|
pub impl Any for UInt with __gt__(self, other) {
  Any::__compare__(self, other) > 0
}

///|
pub impl Any for BigInt with __gt__(self, other) {
  Any::__compare__(self, other) > 0
}

///|
pub impl Any for Int64 with __gt__(self, other) {
  Any::__compare__(self, other) > 0
}

///|
pub impl Any for UInt64 with __gt__(self, other) {
  Any::__compare__(self, other) > 0
}

///|
pub impl Any for Char with __gt__(self, other) {
  Any::__compare__(self, other) > 0
}

///|
pub impl Any for String with __gt__(self, other) {
  Any::__compare__(self, other) > 0
}

///|
/// 数组与数值类型按数值语义比较（先转换为 number）；
/// 与BigInt先转换为数值进行比较；
/// 与数组或字符串按字符串比较。
pub impl Any for Array[&Any] with __le__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" =>
      compare_string(Any::__str__(self), Any::__str__(other)) >= 0
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      compare_bigint_and_number(other_bi, number(self)) >= 0
    }
    _ => number(self) >= number(other)
  }
}

///|
/// 数组按数值语义比较（先转换为 number）。
pub impl Any for FixedArray[&Any] with __le__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" =>
      compare_string(Any::__str__(self), Any::__str__(other)) >= 0
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      compare_bigint_and_number(other_bi, number(self)) >= 0
    }
    _ => number(self) >= number(other)
  }
}

///|
/// 布尔先转为数值后与其他基本类型按数值类型比较；
/// 与BigInt比较时先转换为BigInt；
/// 其他类型返回false。
pub impl Any for Bool with __le__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      compare_bigint_and_number(other_bi, if self { 1.0 } else { 0.0 }) <= 0
    }
    _ => number(self) >= number(other)
  }
}

///|
/// 数值类型与其它基本类型按数值比较，其他类型返回 false。
pub impl Any for Int16 with __le__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      other_bi.compare_int(self.to_int()) >= 0
    }
    _ => number(self) >= number(other)
  }
}

///|
/// 数值类型与其它基本类型按数值比较，其他类型返回 false。
pub impl Any for Int with __le__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      other_bi.compare_int(self) >= 0
    }
    _ => number(self) >= number(other)
  }
}

///|
/// 数值类型与其它基本类型按数值比较，其他类型返回 false。
pub impl Any for UInt16 with __le__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      other_bi.compare_int(self.to_int()) >= 0
    }
    _ => number(self) >= number(other)
  }
}

///|
/// 数值类型与其它基本类型按数值比较，其他类型返回 false。
pub impl Any for UInt with __le__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      other_bi.compare_int64(self.to_int64()) >= 0
    }
    _ => number(self) >= number(other)
  }
}

///|
/// BigInt 与另一个 BigInt 比较，其他类型返回 false。
pub impl Any for BigInt with __le__(self, other) {
  match Any::__type__(other) {
    "BigInt" => {
      let self_bi = BigInt::from_string(Any::__str__(self))
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi <= other_bi
    }
    _ => {
      let other_num = number(other)
      if other_num.is_nan() {
        false
      } else {
        compare_bigint_and_number(self, other_num) <= 0
      }
    }
  }
}

///|
/// BigInt 与另一个 BigInt 比较，其他类型返回 false。
pub impl Any for Int64 with __le__(self, other) {
  let self_bi = BigInt::from_int64(self)
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi <= other_bi
    }
    _ => {
      let other_num = number(other)
      if other_num.is_nan() {
        false
      } else {
        compare_bigint_and_number(self_bi, other_num) <= 0
      }
    }
  }
}

///|
/// BigInt 与另一个 BigInt 比较，其他类型返回 false。
pub impl Any for UInt64 with __le__(self, other) {
  let self_bi = BigInt::from_uint64(self)
  match Any::__type__(other) {
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      self_bi <= other_bi
    }
    _ => {
      let other_num = number(other)
      if other_num.is_nan() {
        false
      } else {
        compare_bigint_and_number(self_bi, other_num) <= 0
      }
    }
  }
}

///|
/// 若另一个值为数值则按数值语义比较（先转换为 number）；
/// 若是数组或字符串则按字符串比较（先转换为String）。
pub impl Any for Char with __le__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" =>
      compare_string(self.to_string(), Any::__str__(other)) <= 0
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      compare_bigint_and_number(other_bi, number(self)) >= 0
    }
    _ => number(self) <= number(other)
  }
}

///|
/// 若另一个值为数值则按数值语义比较（先转换为 number）；
/// 若是数组或字符串则按字符串比较（先转换为String）。
pub impl Any for String with __le__(self, other) {
  match Any::__type__(other) {
    "Array" | "String" => compare_string(self, Any::__str__(other)) <= 0
    "BigInt" => {
      let other_bi = BigInt::from_string(Any::__str__(other))
      compare_bigint_and_number(other_bi, number(self)) >= 0
    }
    _ => number(self) <= number(other)
  }
}

///|
pub impl Any for Array[&Any] with __lt__(self, other) {
  Any::__compare__(self, other) < 0
}

///|
pub impl Any for FixedArray[&Any] with __lt__(self, other) {
  Any::__compare__(self, other) < 0
}

///|
pub impl Any for Bool with __lt__(self, other) {
  Any::__compare__(self, other) < 0
}

///|
pub impl Any for Int16 with __lt__(self, other) {
  Any::__compare__(self, other) < 0
}

///|
pub impl Any for Int with __lt__(self, other) {
  Any::__compare__(self, other) < 0
}

///|
pub impl Any for UInt16 with __lt__(self, other) {
  Any::__compare__(self, other) < 0
}

///|
pub impl Any for UInt with __lt__(self, other) {
  Any::__compare__(self, other) < 0
}

///|
pub impl Any for BigInt with __lt__(self, other) {
  Any::__compare__(self, other) < 0
}

///|
pub impl Any for Int64 with __lt__(self, other) {
  Any::__compare__(self, other) < 0
}

///|
pub impl Any for UInt64 with __lt__(self, other) {
  Any::__compare__(self, other) < 0
}

///|
pub impl Any for Char with __lt__(self, other) {
  Any::__compare__(self, other) < 0
}

///|
pub impl Any for String with __lt__(self, other) {
  Any::__compare__(self, other) < 0
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
  self.to_uint().to_double().to_string()
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
/// 将各种 `Any` 类型（Array/Boolean/Number/String/Null）解析为 Double。
/// 若不能解析则返回 NaN（@double.not_a_number）。
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

///|
/// 将两个字符串按逐个Unicode码点大小比较，较大的一方更大；
/// 若其中一个字符串的前缀为另外一个字符串；
/// 则长度更长的一方更大。
/// 若两个字符串相同则返回0。
fn compare_string(a : String, b : String) -> Int {
  let a_len = a.length()
  let b_len = b.length()
  let n = if a_len < b_len { b_len } else { a_len }
  // 逐字比较
  for i in 0..<n {
    if a[i] > b[i] {
      return 1
    } else if a[i] < b[i] {
      return -1
    }
  }
  if a_len > b_len {
    1
  } else if a_len < b_len {
    -1
  } else {
    0
  }
}

///|
fn compare_bigint_and_number(bi : BigInt, num : Double) -> Int {
  let frac_p = num - num.floor()
  let int_p = num.to_int64()
  if bi.compare_int64(int_p) > 0 {
    1
  } else if bi.compare_int64(int_p) < 0 {
    -1
  } else if frac_p > 0 {
    -1
  } else {
    0
  }
}
