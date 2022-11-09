ScriptManger = {}

function ScriptManger.copyScript(instance:Instance, script:Script)
    local newScript = script:Clone()
    newScript.Parent = instance
    newScript.Disabled = false
end

return ScriptManger