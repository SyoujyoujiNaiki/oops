///|
pub struct ObjMethod {
  params_type : FixedArray[String]
  application : (FixedArray[&Any]) -> &Any
}

///|
pub fn ObjMethod::new(
  params_type : FixedArray[String],
  application : (FixedArray[&Any]) -> &Any,
) -> Self {
  ObjMethod::{ params_type, application }
}

///|
pub fn new_objm(
  params_type : FixedArray[String],
  application : (FixedArray[&Any]) -> &Any,
) -> ObjMethod {
  ObjMethod::{ params_type, application }
}

///|
pub fn ObjMethod::apply(self : Self, params : FixedArray[&Any]) -> &Any {
  (self.application)(params)
}
