
local oldpath = package.path
package.path = '?.luac;?.lua;./lua/?.luac;./lua/?.lua'
require 'metalua.mlc_xcall'
require 'metalua.compiler'
local gwt_define = './lua/gwt_define.mlua'
mlc.function_of_luacstring(mlc.luacstring_of_ast(mlc.luafile_to_ast(gwt_define)))()
package.path = oldpath

local filename = './test/example/step_definitons/calculator_steps.lua'
local ast = mlc.luafile_to_ast(filename)
local bytecode = mlc.luacstring_of_ast(ast)
local f = mlc.function_of_luacstring(bytecode)
f()
print("run ".. filename)
print("")
_Given:fun("I have entered 6 into the calculator")
_Given:fun("I have entered 7 into the calculator")
_When:fun("I press add")
_Then:fun("the result should be 13 on the screen")

print("Test OK!")
