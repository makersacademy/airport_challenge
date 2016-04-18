[![Build Status](https://travis-ci.org/ccfz/airport_challenge.svg?branch=master)](https://travis-ci.org/ccfz/airport_challenge)

# Airport Challenge:

### User story:

* Create an airport where planes and land and take-off. If there is a storm the plane should not be able to land/take-off.

### How I completed the challenge

I went about the challenge by looking at the user stories one by one and creating the methods and classes based on that. 

First I just created the airport and planes with three simple airport methods that would store and return planes (arrive & depart) and a attr reader to see, which planes are currently at the airport (planes).

I then introduced the weather to the whole application. At the beginning I just had one weather method that would always return storm, which allowed me to change the behaviour of the others methods with ease. I figured that the weather at airports are unique and that depending on the airport the chance of storm are different. Therefore the air_controller needs to check the local weather when a plane lands (i.e. pass a weather instance with the plan instance)

I then introduced a simple random method to my weather class, which would return "storm" 1 out of 4 times. I wrote a test to check that numbers 2,3 & 4 return sunny and only 1 return storm. 

Finally I added multiple guard conditions that would prevent landed planes, to land again. That required some additional methods to the plane class, as the plane did not have a status prior.


###### Application example: 
```
require_relative './lib/airport.rb'
require_relative './lib/plane.rb'
require_relative './lib/weather.rb'

american_1 = Plane.new
lufthansa_1 = Plane.new

heathrow = Airport.new
frankfurt = Airport.new

heath_weather = Weather.new
frank_weather = Weather.new


frankfurt.arrive(american_1, frank_weather)
frankfurt.arrive(lufthansa_1, frank_weather)

frankfurt.planes

frankfurt.depart(lufthansa_1, frank_weather)
frankfurt.planes


heathrow.arrive(lufthansa_1, heath_weather)
heathrow.planes
frankfurt.planes
```