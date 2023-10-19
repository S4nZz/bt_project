warn('Running Bypass..!!')
local Namecall
Namecall = hookmetamethod(game, '__namecall', function(self, ...)
    local Caller = tostring(getcallingscript())
    local Method = getnamecallmethod()
    if Caller == 'ClientMover' and Method == 'GetService' then
        return
    end                                       
    return Namecall(self, ...)
end)
print('Waiting....')
wait(1)
repeat task.wait() until game:isLoaded()
repeat task.wait() until game:GetService("RunService"):IsClient()
wait(1)
for i,v in pairs(getgc(true)) do
    if type(v) == "function" and islclosure(v) then
        local Constants = debug.getconstants(v)
         if (getinfo(v).name == "_check") then
            loadstring([[
                local hook = hookfunction or hookfunc or replace_closure or replacehook
                local v, NewFunction = ...
                local Hook = hook(v, function(...)
                    return NewFunction(true)
                end)
            ]])(v, NewFunction)
        end
    end
end
print('Bypass Success...!!!')
