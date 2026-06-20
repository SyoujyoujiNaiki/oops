///|
suberror NoImpl

///|
pub(open) trait Any {
  fn layer(Self) -> AnyLayer
  fn __repr__(Self) -> String raise NoImpl = _
  fn __add__(Self, &Any) -> &Any raise NoImpl = _
  fn __sub__(Self, &Any) -> &Any raise NoImpl = _
  fn __mul__(Self, &Any) -> &Any raise NoImpl = _
  fn __div__(Self, &Any) -> &Any raise NoImpl = _
  fn __mod__(Self, &Any) -> &Any raise NoImpl = _
  fn __radd__(Self, &Any) -> &Any raise NoImpl = _
  fn __rsub__(Self, &Any) -> &Any raise NoImpl = _
  fn __rmul__(Self, &Any) -> &Any raise NoImpl = _
  fn __rdiv__(Self, &Any) -> &Any raise NoImpl = _
  fn __rmod__(Self, &Any) -> &Any raise NoImpl = _
  fn __eq__(Self, &Any) -> Bool raise NoImpl = _
  fn __compare__(Self, &Any) -> Int raise NoImpl = _
  fn __ge__(Self, &Any) -> Bool raise NoImpl = _
  fn __gt__(Self, &Any) -> Bool raise NoImpl = _
  fn __le__(Self, &Any) -> Bool raise NoImpl = _
  fn __lt__(Self, &Any) -> Bool raise NoImpl = _
  fn __req__(Self, &Any) -> Bool raise NoImpl = _
  fn __rcompare__(Self, &Any) -> Int raise NoImpl = _
  fn __rge__(Self, &Any) -> Bool raise NoImpl = _
  fn __rgt__(Self, &Any) -> Bool raise NoImpl = _
  fn __rle__(Self, &Any) -> Bool raise NoImpl = _
  fn __rlt__(Self, &Any) -> Bool raise NoImpl = _
  fn __neg__(Self) -> &Any raise NoImpl = _
}

///|
impl Any with fn __add__(_, _) raise NoImpl {
  raise NoImpl
}

///|
impl Any with fn __sub__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __mul__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __div__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __mod__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __radd__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __rsub__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __rmul__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __rdiv__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __rmod__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __compare__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __ge__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __gt__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __le__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __lt__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __eq__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __req__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __rcompare__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __rge__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __rgt__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __rle__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __rlt__(_, _) {
  raise NoImpl
}

///|
impl Any with fn __neg__(_) {
  raise NoImpl
}

///|
impl Any with fn __repr__(_) {
  raise NoImpl
}

///|
pub impl Add for &Any with fn add(self, other) {
  self.__add__(other) catch {
    _ => other.__radd__(self) catch { _ => abort("No Implement!") }
  }
}

///|
pub impl Sub for &Any with fn sub(self, other) {
  self.__sub__(other) catch {
    _ => other.__rsub__(self) catch { _ => abort("No Implement!") }
  }
}

///|
pub impl Mul for &Any with fn mul(self, other) {
  self.__mul__(other) catch {
    _ => other.__rmul__(self) catch { _ => abort("No Implement!") }
  }
}

///|
pub impl Div for &Any with fn div(self, other) {
  self.__div__(other) catch {
    _ => other.__rdiv__(self) catch { _ => abort("No Implement!") }
  }
}

///|
pub impl Mod for &Any with fn mod(self, other) {
  self.__mod__(other) catch {
    _ => other.__rmod__(self) catch { _ => abort("No Implement!") }
  }
}

///|
pub impl Eq for &Any with fn equal(self, other) {
  self.__eq__(other) catch {
    _ => abort("No Implement!")
  }
}

///|
pub impl Neg for &Any with fn neg(self) {
  self.__neg__() catch {
    _ => abort("No Implement!")
  }
}

///|
pub impl Compare for &Any with fn compare(self, other) {
  self.__compare__(other) catch {
    _ => other.__rcompare__(self) catch { _ => abort("No Implement!") }
  }
}

///|
pub impl Compare for &Any with fn op_ge(self, other) {
  self.__ge__(other) catch {
    _ => other.__rge__(self) catch { _ => abort("No Implement!") }
  }
}

///|
pub impl Compare for &Any with fn op_gt(self, other) {
  self.__gt__(other) catch {
    _ => other.__rgt__(self) catch { _ => abort("No Implement!") }
  }
}

///|
pub impl Compare for &Any with fn op_le(self, other) {
  self.__le__(other) catch {
    _ => other.__rle__(self) catch { _ => abort("No Implement!") }
  }
}

///|
pub impl Compare for &Any with fn op_lt(self, other) {
  self.__lt__(other) catch {
    _ => other.__rlt__(self) catch { _ => abort("No Implement!") }
  }
}

///|
pub impl Show for &Any with fn to_string(self) {
  self.__repr__() catch {
    _ => abort("No Implement!")
  }
}

///|
pub extenum AnyLayer {
  Boolean(Bool)
  Scalar8(Byte)
  Scalar16(Int16)
  Scalar32(Int)
  Scalar64(Int64)
  Number(Double)
  Chars(String)
  Data(Bytes)
  None
}

///|
pub impl Any for AnyLayer with fn layer(self) {
  self
}
