Airport Challenge
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

Travis CI: 
![alt text](https://travis-ci.org/DXTimer/airport_challenge.svg?branch=master "Travis CI")

Coveralls: 
![alt text](https://coveralls.io/builds/5820345 "Coveralls")

Summary
-----

Makers Academy has asked me to design a traffic control system while following the TDD approach. 
With the [user stories](../blob/master/blob/user_stories.md) provided by the client I design a system that:

- Airport Traffic Control can `issue_landing_permission(plane)` for a given plane
- Airport Traffic Control can `issue_take_off_permission(plane)` for a given plane
- Airport keeps active record of the `planes` removing for `take_off` and adding `land`
- Planes `landed?` status updated
- Airport has alert system for poor weather conditions, and prohibits take_off and landing
- Airport can be set a `capacity` otherwise it defaults to `DEFAULT_CAPACITY = 20`
- Airport prevents landing if `full?`
- Edge cases implemented to defends against actions with inconsistent states


Weather Station
----
The `Airport` class contains a initialization variable called `weather_station` which defaults to [weather_station.rb](../blob/master/lib/weather_station.rb)
This is done with the idea that when an object of `Airport.new` is called it will allow to set another source of weather forcast, which is less random.

Feature Test Sample
----
```ruby
require './lib/airport'
require './lib/plane'
require './lib/weather_station'

#Initialize objects
weather_station = WeatherStation.new
airport = Airport.new(weather_station)
plane = Plane.new
array_of_planes = Array.new(19) { Plane.new }

#Scenario_01
#Stake a landing and inspect the state of the objects
puts plane
airport.issue_landing_permission(plane)
puts "Current planes present in airport: #{airport.planes}"
puts "Plane landed status: #{plane.landed?}"
```
*OUTPUT*
```
$ ruby feature_test.rb 
#<Plane:0x000000026668e8>
Current planes present in airport: [#<Plane:0x000000026668e8 @landed=true>]
Plane landed status: true
```


