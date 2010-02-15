
package.path = '?.luac;?.lua;./lua/?.luac;./lua/?.lua'
require 'metalua.mlc_xcall'
require 'metalua.compiler'
local filename = './test/simple_gwt.feature'
local ast = mlc.luafile_to_ast(filename)
local bytecode = mlc.luacstring_of_ast(ast)
local f = mlc.function_of_luacstring(bytecode)
print("run ".. filename)
print("")
f()
print("Bye")
