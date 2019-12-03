;; @xform export "foo" () anyref_owned

(module
  (func $foo (export "foo") (result i32)
    i32.const 0)

  (func $alloc (export "__wbindgen_anyref_table_alloc") (result i32)
    i32.const 0)
  (func $dealloc (export "__wbindgen_anyref_table_dealloc") (param i32))
)

(; CHECK-ALL:
(module
  (type (;0;) (func (result i32)))
  (type (;1;) (func (result anyref)))
  (type (;2;) (func (param i32)))
  (func $foo anyref shim (type 1) (result anyref)
    (local i32)
    call $foo
    local.tee 0
    table.get 0
    local.get 0
    call $dealloc)
  (func $foo (type 0) (result i32)
    i32.const 0)
  (func $alloc (type 0) (result i32)
    i32.const 0)
  (func $dealloc (type 2) (param i32))
  (table (;0;) 32 anyref)
  (export "foo" (func $foo anyref shim))
  (export "__wbindgen_anyref_table_alloc" (func $alloc))
  (export "__wbindgen_anyref_table_dealloc" (func $dealloc)))
;)
