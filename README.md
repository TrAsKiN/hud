# A dashboard for FiveM

A dashboard with a clean but complete design.

## Requirements

Works with **[vehicles](https://github.com/TrAsKiN/vehicles)** for better performance.

If you want to use it as a standalone, you will need to create two functions and trigger an event.

### Functions required

- `exports.vehicles:getSeatbeltStatus()`
  - **return**: a *boolean* if the seat belt is attached
- `exports.vehicles:getSpeedLimit()`
  - **return**: a *number* corresponding to the speed limit in km/h

### Event required

- `vehicle:player:entered`
  - **parameter**: the *vehicle* in which the player has entered

# License

License under consideration...
