print "cmd script beta 0.1"


while true do

function wait(cmdSleepGetNum)-- you can name this function
--what ever you want, it doesnt matter
  local start = os.time()
  repeat until os.time() > start + cmdSleepGetNum
end

local input = io.read()


if input == "/help" then
print"you'll find it out"


else if input == "/say" then
print"what do you want to say?"
local cmdSay = io.read()
print(cmdSay)



else if input == "/stop" then
os.exit()



else if input == "/sleep" then
print"how long?"
local cmdSleepGetNum = io.read()
wait(cmdSleepGetNum)



else if input == "/rand" then
local randNum = math.random()
print(randNum)



else if input == "/extra" then
print"i am cooler than you"


end
end
end
end
end
end







end
