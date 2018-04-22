# Airport Challenge

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Makers Academy week one weekend challenge to build a programme to control the flow of planes at an airport. Controlling for the airport capacity and the weather, planes can land and take off.

## Feature overview

- An airport can be created: `airport = Airport.new`
- The capacity of the airport can be controlled: `airport.change_capacity`
- Planes can land: `airport.land_plane(Plane.new)`
- Already landed planes can then take off: `airport.plane_take_off(plane)`
- Bad weather will prevent planes from landing or taking off (random number generator for 1/20 but can be overwritten using `airport.change_weather(true)` for good weather)
- Test lead through `RSpec`

### Installation and set-up

1. Clone the repo:
```
git clone git@github.com:benfurber/airport_challenge.git
```
2. Open the directory:
```
cd airport_challenge
```
3. Install bundle (if required) and run it:
```
gem install bundle
bundle
```
4. Check that the tests are still running and valid:
```
rspec
```

### User stories covered in the challenge

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
