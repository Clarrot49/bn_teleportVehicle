RegisterNetEvent("bn_teleportVehicle:server:teleport", function(source, targetID)
    local player = source
    local playerPed = GetPlayerPed(player)
    local targetPed = GetPlayerPed(targetID)
    
    if not playerPed or not targetPed then return end

    local targetVehicle = GetVehiclePedIsIn(targetPed, false)

    if not targetVehicle  or not DoesEntityExist(targetVehicle) then
        lib.notify({
            title = 'Error',
            description = 'Unable to find target vehicle.',
            type = 'error'
        })
        return
    end

    if GetPedInVehicleSeat(targetVehicle, 0) == 0 then
        TaskWarpPedIntoVehicle(playerPed, targetVehicle, 0)
    elseif GetPedInVehicleSeat(targetVehicle, 1) == 0 then
        TaskWarpPedIntoVehicle(playerPed, targetVehicle, 1)
    elseif GetPedInVehicleSeat(targetVehicle, 2) == 0 then
        TaskWarpPedIntoVehicle(playerPed, targetVehicle, 2)
    else
        lib.notify({
            title = 'Error',
            description = 'All vehicle seats occupied.',
            type = 'error'
        })
    end
end)