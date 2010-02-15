-{ block:

    local function builder (x)
        local str, args, block = unpack(x)
        local run = `Function{{`Id"self", unpack(args)}, block}
        local fun = +{function(self, x) self:_run(string.gmatch(x, self.patten)()); end}
        return +{stat: When={patten=-{str}, _run=-{run}, fun=-{fun}}}
    end

    local function then_builder (x)
        local str, args, block = unpack(x)
        local run = `Function{{`Id"self", unpack(args)}, block}
        local fun = +{function(self, x) self:_run(string.gmatch(x, self.patten)()); end}
        return +{stat: Then={patten=-{str}, _run=-{run}, fun=-{fun}}}
    end

    mlp.lexer:add{"given", "when", "|"}

    mlp.stat:add{ name = 'when statement',
        'when',
        mlp.string, 'do', '|', mlp.func_params_content, '|', mlp.block, 'end',
        builder = builder }
    mlp.stat:add { name = 'then statement',
        'then',
        mlp.string, 'do', '|', mlp.func_params_content, '|', mlp.block, 'end',
        builder = then_builder
    }
}

local str = [[{"id":123,"target":32770,"source":32770,"parameters":[]}]]
local ip = '10.10.50.50'
local port = 60010

do
local data = {str = str, ip = ip, port = port}
--~ require 'socket.core'
--~ local u = socket.udp()

when "send%s*(%w+),(%w+),(%w+)"  do |x, y, z|
    print(data[x], data[y], data[z])
end

then 'receive%s*(%w+)' do |x|
    --~ local str, _, _ = u:receivefrom()
    --~ assert(data[x] == str, tostring(str))
    print(data[x])
end
end

--~ main run
--~ in feature file
When:fun("send str,ip,port")
Then:fun('receive str')


