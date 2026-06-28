///|
pub type Any = &@oops.Any

///|
test "boolean" {
  let b = true
  println((b as Any) + '1')
  println((b as Any) - '1')
  println((b as Any) * '1')
  println((b as Any) / '0')
  println((b as Any) % 2)
  println(-(b as Any))
  println((b as Any) == true)
  println((b as Any) == false)
  println((b as Any) > false)
  println((b as Any) < true)
  println(Any::__repr__(b))
}

///|
test "byte" {
  let b : Byte = 42
  println((b as Any) + 1)
  println((b as Any) - 1)
  println((b as Any) * 2)
  println((b as Any) / 2)
  println((b as Any) % 3)
  println(-(b as Any))
  println((b as Any) == 42)
  println((b as Any) > 10)
  println((b as Any) < 100)
  println((b as Any).__repr__())
}

///|
test "int16" {
  let v : Int16 = 42
  println((v as Any) + Int16::from_int(1))
  println((v as Any) - Int16::from_int(1))
  println((v as Any) * Int16::from_int(2))
  println((v as Any) / Int16::from_int(2))
  println((v as Any) % Int16::from_int(3))
  println(-(v as Any))
  println((v as Any) == Int16::from_int(42))
  println((v as Any) > Int16::from_int(10))
  println((v as Any).__repr__())
}

///|
test "int" {
  let v = 42
  println((v as Any) + 1)
  println((v as Any) - 1)
  println((v as Any) * 2)
  println((v as Any) / 2)
  println((v as Any) % 3)
  println(-(v as Any))
  println((v as Any) == 42)
  println((v as Any) > 10)
  println((v as Any) < 100)
  println((v as Any).__repr__())
}

///|
test "int64" {
  let v : Int64 = 42
  println((v as Any) + Int64::from_int(1))
  println((v as Any) - Int64::from_int(1))
  println((v as Any) * Int64::from_int(2))
  println((v as Any) / Int64::from_int(2))
  println((v as Any) % Int64::from_int(3))
  println(-(v as Any))
  println((v as Any) == Int64::from_int(42))
  println((v as Any) > Int64::from_int(10))
  println((v as Any).__repr__())
}

///|
test "double" {
  let v = 3.14
  println((v as Any) + 1.0)
  println((v as Any) - 1.0)
  println((v as Any) * 2.0)
  println((v as Any) / 2.0)
  println((v as Any) % 1.5)
  println(-(v as Any))
  println((v as Any) == 3.14)
  println((v as Any) > 1.0)
  println((v as Any) < 10.0)
  println((v as Any).__repr__())
}

///|
test "float" {
  let v : Float = 3.14
  println((v as Any) + 1.0)
  println((v as Any) - 1.0)
  println((v as Any) * 2.0)
  println((v as Any) / 2.0)
  println(-(v as Any))
  println((v as Any).__repr__())
}

///|
test "bigint" {
  let v = BigInt::from_int(42)
  println((v as Any) + BigInt::from_int(1))
  println((v as Any) - BigInt::from_int(1))
  println((v as Any) * BigInt::from_int(2))
  println((v as Any) / BigInt::from_int(2))
  println((v as Any) % BigInt::from_int(3))
  println(-(v as Any))
  println((v as Any) == BigInt::from_int(42))
  println((v as Any) > BigInt::from_int(10))
  println((v as Any).__repr__())
}

///|
test "string" {
  let v = "hello"
  println((v as Any) + " world")
  println((v as Any) == "hello")
  println((v as Any) > "abc")
  println((v as Any) < "xyz")
  println((v as Any).__repr__())
}

///|
test "char" {
  let v = 'A'
  println((v as Any) + "BC")
  println((v as Any) == 'A')
  println((v as Any).__repr__())
}

///|
test "bytes" {
  let v = b"ABC"
  println((v as Any) + b"DEF")
  println((v as Any) == b"ABC")
  println((v as Any).__repr__())
}
