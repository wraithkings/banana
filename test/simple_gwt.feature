local str = [[{"id":123,"target":32770,"source":32770,"parameters":[]}]]
local ip = '10.10.50.50'
local port = 60010

do
local data = {str = str, ip = ip, port = port}
--~ require 'socket.core'
--~ local u = socket.udp()

When "send%s*(%w+),(%w+),(%w+)"  do |x, y, z|
    print(data[x], data[y], data[z])
end

Then 'receive%s*(%w+)' do |x|
    --~ local str, _, _ = u:receivefrom()
    --~ assert(data[x] == str, tostring(str))
    print(data[x])
end
end

--~ main run
--~ in feature file
_When:fun("send str,ip,port")
_Then:fun('receive str')


