
local calculator = {}
calculator.enter = function(self, d)
    if not self._nums then
        self._nums = {}
    end
    
    table.insert(self._nums, d)
end

calculator.add = function(self)
    if not self.result then
        self.result = 0
    end
    
    if not self._nums then
        self.result = 0
        return
    elseif #self._nums == 0 then
        self.result = 0
        return
    elseif #self._nums == 1 then
        self.result = self._nums[1]
    end
    
    for i, v in ipairs(self._nums) do
        self.result = self.result + self._nums[i]
    end
end

Given [[I have entered (%d+) into the calculator]] do |x|
    calculator:enter(tonumber(x))
end

When [[I press (%w+)]] do |x|
    calculator[x](calculator)
end

Then [[the result should be (%d+) on the screen]] do |x|
    assert(calculator.result == tonumber(x), calculator.result)
end
