function DispDefualtMsg()
	print(" cmd script  alpha1.1.6")
end

DispDefualtMsg()

local function wait (cmdSleepGetNum) -- you can name this function
-- whatever you want, it doesn't matter.
  local start = os.time ()
  repeat until os.time () > start + cmdSleepGetNum
end

local commands = {
		ver = function ()
			local VER_ = "alpha 1.1.7"
			print(VER_)
		end,
		console = function (arg)
			MainLoop = false
		end,
		clr = function (arg)
			print"are you a unix user? Y or N"
			arg = io.read()
			
			if arg == "y" or "Y" then
				os.execute("clear")
				DispDefualtMsg()
			elseif arg == "n" or "N" then
				os.execute("cls")
				DispDefualtMsg()
				end
		end,
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

MainLoop = true

-- Main loop:
while MainLoop do
    io.write '> '
    local key, _, arg ,arg2 = io.read ():match '^%s*/(%S+)(%s*(.*))$' -- you can type /sleep 1, etc. in one line.
    local command = key and key ~= '' and commands [key] or commands [false]
    command (arg, arg2)

end
