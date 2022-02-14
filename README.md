# A dashboard for FiveM

A dashboard with a clean but complete design.

![HUD in game](hud.gif)

## Requirements

You have to register callback functions to activate some features.

### Registering callback functions

```lua
exports.hud:registerSeatbeltFunction(function ()
    return seatbelt -- a boolean if the seat belt is attached
end)
```

```lua
exports.hud:registerSpeedLimitFunction(function ()
    return speedLimit -- a number corresponding to the speed limit in km/h
end)
```

# License

Under MIT license
