AddEventHandler('vehicle:player:entered', function (vehicle)
    local vehicleModel = GetEntityModel(vehicle)
    if not IsThisModelABicycle(vehicleModel) then
        SendNUIMessage({
            action = 'open'
        })
        CreateThread(function ()
            local hide = false
            local maxSpeed = GetVehicleModelEstimatedMaxSpeed(vehicleModel)
            local maxFuel = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fPetrolTankVolume')
            while true do
                if not hide and IsPauseMenuActive() then
                    SendNUIMessage({
                        action = 'close'
                    })
                    hide = true
                elseif hide and not IsPauseMenuActive() then
                    SendNUIMessage({
                        action = 'open'
                    })
                    hide = false
                end
                local playerPed = PlayerPedId()
                if not IsPedInAnyVehicle(playerPed) then
                    SendNUIMessage({
                        action = 'close'
                    })
                    return
                end
                if GetPedInVehicleSeat(vehicle, -1) == playerPed then
                    local tiresAlert = false
                    for _, wheelId in ipairs({0, 1, 2, 3, 4, 5, 45, 47}) do
                        if IsVehicleTyreBurst(vehicle, wheelId) then
                            tiresAlert = true
                        end
                    end
                    local _, lightsOn, highbeamsOn = GetVehicleLightsState(vehicle)
                    SendNUIMessage({
                        passenger = false,
                        doors = GetVehicleDoorLockStatus(vehicle),
                        blinkers = GetVehicleIndicatorLights(vehicle),
                        tires = tiresAlert,
                        engine = GetVehicleEngineHealth(vehicle),
                        speed = GetEntitySpeed(vehicle),
                        maxSpeed = maxSpeed,
                        lights = lightsOn,
                        highbeams = highbeamsOn,
                        fuel = GetVehicleFuelLevel(vehicle) * 100 / maxFuel,
                        maxFuel = maxFuel,
                        seatbelt = exports.vehicles:getSeatbeltStatus(),
                        speedLimit = exports.vehicles:getSpeedLimit()
                    })
                else
                    SendNUIMessage({
                        passenger = true,
                        doors = GetVehicleDoorLockStatus(vehicle),
                        seatbelt = exports.vehicles:getSeatbeltStatus()
                    })
                end
                Wait(50)
            end
        end)
    end
end)
