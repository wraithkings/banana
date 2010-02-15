
package.path = '?.luac;?.lua;./lua/?.luac;./lua/?.lua'
require 'metalua.mlc_xcall'
require 'metalua.compiler'
local gwt_define = './lua/gwt_define.mlua'
mlc.function_of_luacstring(mlc.luacstring_of_ast(mlc.luafile_to_ast(gwt_define)))()

local filename = './test/simple_gwt.feature'
local ast = mlc.luafile_to_ast(filename)
local bytecode = mlc.luacstring_of_ast(ast)
local f = mlc.function_of_luacstring(bytecode)
print("run ".. filename)
print("")
f()
print("Bye")
