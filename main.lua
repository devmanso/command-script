
print" cmd script  alpha1.1.3"

local function wait (cmdSleepGetNum) -- you can name this function
-- whatever you want, it doesn't matter.
  local start = os.time ()
  repeat until os.time () > start + cmdSleepGetNum
end

local commands = {

		add = function (num1, num2)
		addnum1 = io.read()
		addnum2 = io.read()
		sum = addnum1 + addnum2
		print (sum)
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
    local key, _, arg = io.read ():match '^%s*/(%S+)(%s*(.*))$' -- you can type /sleep 1, etc. in one line.
    local command = key and key ~= '' and commands [key] or commands [false]
    command (arg)
end
