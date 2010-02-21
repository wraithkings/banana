
local oldpath = package.path
package.path = '?.luac;?.lua;./lua/?.luac;./lua/?.lua'
require 'metalua.mlc_xcall'
require 'metalua.compiler'
local gwt_define = './lua/gwt_define.mlua'
dofile(gwt_define)
package.path = oldpath

local filename = './test/example/step_definitons/calculator_steps.lua'
dofile(filename)
print("run ".. filename)
print("")
local scenario = {}
scenario.Given = {}
scenario.When = {}
scenario.Then = {}
table.insert(scenario.Given, "I have entered 6 into the calculator")
table.insert(scenario.Given, "I have entered 7 into the calculator")
table.insert(scenario.When, "I press add")
table.insert(scenario.Then, "the result should be 13 on the screen")

for i, v in ipairs(scenario.Given) do
    _Given:fun(scenario.Given[i])
end

for i, v in ipairs(scenario.When) do
    _When:fun(scenario.When[i])
end

for i, v in ipairs(scenario.Then) do
    _Then:fun(scenario.Then[i])
end

print("Test OK!")
