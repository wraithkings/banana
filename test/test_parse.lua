require 'luaunit'

TestParseCase = {}

function TestParseCase:test_parse_given()
    local str = [[假如我已经在计算器里输入6]]
    local result = parse(str)
    assert(type(result) == type({}))
    assert(type(result.given) == type({}))
    assert(result.given[1] == 6)
end

LuaUnit.run()
