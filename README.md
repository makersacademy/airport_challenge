# Airport Challenge   [![Build Status](https://travis-ci.org/amaalali/airport_challenge.svg?branch=master)](https://travis-ci.org/amaalali/airport_challenge) [![Coverage Status](https://coveralls.io/repos/github/makersacademy/airport_challenge/badge.svg?branch=master)](https://coveralls.io/github/makersacademy/airport_challenge?branch=master)
=================

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
## Approach
### Naming of commands
The user in for this system was an air traffic controller, thus the naming of methods was done in a manner to allow the controller to feel like he/she is giving an instruction and thus make command easier to issue and remember. To make this natural the user would give instructions to planes and not to the airport.

### Design process and testing
In designing each command, an attempt was made to follow a TDD workflow. Thus a unit test was written and a feature added to pass the test. However the features were written with the other features in mind.

For each feature a testing was written to evaluate the feature's robustness. Attempts were made to consider possible fringe cases that may break the system.

## User Instructions
### Weather
#### Create new weather instance
This is needed at the start of every session.
`weather = Weather.new`  

### Airport
#### Create new airport
To use the default capacity of the airport:
`airport_name = Airport.new`  

To set the capacity to a different value:
`airport_name = Airport.new(custom_number)`  

#### To check the current airport records for a plane
This allows the user to check if a plane is currently landed at the airport:
`airport_name.landed?(plane_name)`

### Planes
#### Landing a plane
`plane_name.proceed_to_land(airport_name, weather.stormy?)`  

#### Giving permission to plane to take-off
`plane_name.takeoff_from(airport_name, weather.stormy?)`  

#### Checking if a plane has landed  
This gives a result of true if the plane has landed and false if it has not landed:
`plane_name.landed?`
