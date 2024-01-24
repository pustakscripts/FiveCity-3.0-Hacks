local doing_hack = false
local result_hack = false

function startHack()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openHack',
        level = h_level,
        tile = tiles
    })
    doing_hack = true

    while doing_hack do
        Citizen.Wait(500)
    end

    return result_hack
end

RegisterNUICallback('gameWin', function(data, cb)
    SetNuiFocus(false, false)
    result_hack = true
    doing_hack = false
end)

RegisterNUICallback('gameFailed', function(data, cb)
    SetNuiFocus(false, false)
    doing_hack = false
    result_hack = false
end)

exports('startHack', startHack)