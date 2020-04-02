#!/usr/bin/swift
/*
 Block comment
 */
import Cocoa // line comment

struct StructName { var s : [StructName?] }
enum EnumName { case Foo, Bar }
protocol ProtocolName { var p : ProtocolName { get set } }
typealias TypeAlias = EnumName

@attr(arg, *)
class ClassName<T> : ProtocolName {
  var property : ClassName
  var t : T
  func method(p: TypeAlias) {
    let c = ClassName()
    self.property = c != nil ? c! : t
  }
}

extension ClassName { }
extension StructName { }

let i: Int = (2 + 2) * 2;
let e = EnumName.Foo;
switch e {
  case .Foo: print("foo\n")
  default: print("""
                 no foo \u1F596 \u{1F596}
                 """)
}

func function<T>(externalName paramName : T) throws {
  func nestedFunc() { }
  nestedFunc()
  function(externalName: paramName + 1)
  throw NSError()
}

#if DEBUG
  print("debug")
#else
  print("nodebug")
#endif
#if swift(>=3.0)
  conditionally not parsed code
#endif

