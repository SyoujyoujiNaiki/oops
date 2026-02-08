///|
pub struct Obj {
  name : String
  attributes : Map[String, &Any]
  methods : Map[String, ObjMethod]
}

///|
fn Obj::mangle_attr(self : Self, name : String) -> String {
  "/O" + self.name + "/A" + name
}

///|
fn Obj::mangle_method(
  self : Self,
  m_name : String,
  obj_m : ObjMethod,
) -> String {
  "/O" +
  self.name +
  "/N" +
  m_name +
  obj_m.params_type.length().to_string() +
  obj_m.params_type.fold(init="", (init, p) => init + "/p" + p)
}

///|
pub fn Obj::__init__(
  name : String,
  attributes? : Map[String, &Any] = Map::new(),
  methods? : Map[String, ObjMethod] = Map::new(),
) -> Self {
  Obj::{ name, attributes, methods }
}

///|
pub fn Obj::__extends__(name : String, parent : Obj) -> Self {
  Obj::{ name, attributes: parent.attributes, methods: parent.methods }
}

///|
pub fn Obj::__getattr__(self : Self, attr_name : String) -> &Any {
  if self.attributes.contains(attr_name) {
    self.attributes[attr_name]
  } else {
    Null::{  }
  }
}

///|
pub fn Obj::__setattr__(
  self : Self,
  attr_name : String,
  attr_value : &Any,
) -> Unit {
  self.attributes[attr_name] = attr_value
}

///|
pub fn Obj::__delattr__(self : Self, attr_name : String) -> Unit {
  self.attributes.remove(attr_name)
}

///|
#alias("_[_]")
pub fn Obj::__method_of__(
  self : Self,
  name : String,
) -> (FixedArray[&Any]) -> &Any {
  self.methods[name].application
}

///|
#alias("_[_]=_")
pub fn Obj::__new_method__(
  self : Self,
  name : String,
  objm : ObjMethod,
) -> Unit {
  self.methods[name] = objm
}

///|
#alias("_[_:_]")
pub fn Obj::__apply__(
  self : Self,
  start~ : String,
  end~ : FixedArray[&Any],
) -> &Any {
  self[start](end)
}

///|
pub impl Any for Obj with __type__(_) {
  "Object"
}

///|
pub impl Any for Obj with __data__(self) {
  let buf = @buffer.new()
  buf.write_string_utf16le(self.name)
  buf.write_string_utf16le("/A")
  for a_name, a_value in self.attributes {
    buf.write_string_utf16le(self.mangle_attr(a_name))
    buf.write_string_utf16le("/")
    buf.write_bytes(a_value.__data__())
  }
  buf.write_string_utf16le("/M")
  for m_name, m_method in self.methods {
    buf.write_string_utf16le(self.mangle_method(m_name, m_method))
    buf.write_string_utf16le("/")
  }
  buf.contents()
}
