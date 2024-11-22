local NDCore = exports["ND_Core"]

RegisterCommand("tvehhicle", function(source, args, rawCommand)
    local player = NDCore:getPlayer(source)
    local targetID = tonumber(args[1])

    if not targetID or not player then 
        lib.notify({
            title = 'Error',
            description = 'Invalid target.',
            type = 'false'
        })
        return
    end

    local isAdmin = false
    for _, group in pairs(player.groups) do
        if type(group) == "table" and group.label == "admin" then
            isAdmin = true
            break
        elseif group == "admin" then
            isAdmin = true
            break
        end
    end

    if not isAdmin then
        lib.notify({
            title = 'Error',
            description = 'You do not have permission to use this command.',
            type = 'error'
        })
    end

    TriggerServerEvent("bn_teleportVehicle:server:teleport", targetID)
    
end, false)