///|
type Any = &@oops.Any

///|
type Null = @oops.Null

///|
test "[]+[]" {
  let a : Array[Any] = []
  let t = (a as Any) + a
  println("> ([] as Any)+[]")
  inspect(t, content="")
  println("< \"\"")
}

///|
test "true+true+true" {
  let t = (true as Any) + true + true
  println("> (true as Any) + true + true")
  inspect(t, content="3")
  println("< 3")
}

///|
test "true-true" {
  let t = (true as Any) - true
  println("> (true as Any) - true")
  inspect(t, content="0")
  println("< 0")
}

///|
test "true==1" {
  let t = (true as Any) == 1
  println("> (true as Any) == 1")
  inspect(t, content="true")
  println("< true")
}

///|
test "9+\"1\"" {
  let t = (9 as Any) + "1"
  println("> (9 as Any) + \"1\"")
  inspect(t, content="91")
  println("< \"91\"")
}

///|
test "91-\"1\"" {
  let t = (91 as Any) - "1"
  println("> (91 as Any) - \"1\"")
  inspect(t, content="90")
  println("< 90")
}

///|
test "[]==0" {
  let a : Array[Any] = Array::new()
  let t = (a as Any) == 0
  println("> ([] as Any)==0")
  inspect(t, content="true")
  println("< true")
}

///|
test "1-[null]" {
  let t = (1 as Any) - [Null::{  } as Any]
  println("> 1 as Any - [Null::{  }]")
  inspect(t, content="1")
  println("< 1")
}
