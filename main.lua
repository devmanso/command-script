print" cmd script  alpha1.1.4"

local function wait (cmdSleepGetNum) -- you can name this function
-- whatever you want, it doesn't matter.
  local start = os.time ()
  repeat until os.time () > start + cmdSleepGetNum
end

local commands = {
		
		div = function (arg, arg2)
			arg = tonumber( io.read() )
			arg2 = tonumber( io.read() )		
			local div_ = arg / arg2
			print(div)
		end,
		multiply = function (arg, arg2)
			arg = tonumber( io.read() )
			arg2 = tonumber( io.read() )
			local product = arg * arg2
			print(product)
		end,
		
		subtract = function (arg, arg2)
			arg = tonumber( io.read() )
			arg2 = tonumber( io.read() )
			local diff = arg - arg2
			print(diff)
		end,
		add = function (arg, arg2)
			arg = tonumber( io.read() )
			arg2 = tonumber( io.read() )
			sum = arg + arg2
		print(sum)
		end,
    help = function ()
        print "you'll find it out"
    end,
    say = function (arg)
        if arg == '' then
            print 'what do you want to say?'
            arg = io.read ()
        end
        print (arg)
    end,
    stop = function ()
        os.exit ()
    end,
    sleep = function (arg)
        if arg == '' then
            print 'how long?'
            arg = tonumber (io.read ())
        end
        wait (tonumber (arg))
    end,
    rand = function ()      
        local randNum = math.random ()
        print (randNum)
    end,
    [false] = function ()   -- fallback.
        print 'Unknown command'
    end
}

-- Main loop:
while true do
    io.write '> '
    local key, _, arg ,arg2, addnum2 = io.read ():match '^%s*/(%S+)(%s*(.*))$' -- you can type /sleep 1, etc. in one line.
    local command = key and key ~= '' and commands [key] or commands [false]
    command (arg, arg2)

end
