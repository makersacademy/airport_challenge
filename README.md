# Airport Challenge

This repository is a Ruby implementation of the Makers Academy Airport Challenge which can be found [here], if you have access to it.

Running the lib files in IRB allows the controller to create planes, airports and weather generators. Planes can be landed at airports up to a certain capacity and the weather classes allow the user to decide the probability of stormy weather. Stormy weather prevents planes from taking off or landing.

Further steps could be to create different types of plane - jumbo jets might take up less airport capacity than twin seaters - or to create a runway attribute for airports if the user wanted to have planes landing at specific times. The idea might be that airports with more runways can have more planes landing and taking off at once.

## Usage

There are three classes: Airport, Plane and Weather. We show how the software in this repository could be used by an Air Traffic Controller at Heathrow airport (a large international airport) during summer.

```ruby
require 'airport'
require 'plane'
require 'weather'

# There is a roughly 70% chance of stormy weather in British summer.
british_summer = Weather.new(0.7)

# We can create Heathrow, by passing british_summer and 60 as parameters to the Airport class.
heathrow_airport = Airport.new(british_summer, 60)

# If we try to land a plane at Heathrow we have a 60% chance of getting an error due to stormy weather.
boeing_747 = Plane.new
heathrow_airport.land(boeing_747)
# => might have raised "Unable to land plane due to stormy weather"

# We can create the Madrid–Barajas Airport.
spanish_summer = Weather.new(0)
madrid_barajas_airport = Airport.new(spanish_summer)

# Landing planes here is easy because it is never stormy.
airbus_a380 = Plane.new
madrid_barajas_airport.land(airbus_a380)
madrid_barajas_airport.landed_planes
# => [airbus_a380]

# If for some reason a large fleet of planes try to land at  Madrid–Barajas Airport we will get an error message.
fleet_of_planes = []
40.times { fleet << Plane.new }

fleet_of_planes.each do |plane|
  madrid_barajas_airport.land(plane)
end
# => raises "Airport at capacity" after landing the first 19 planes.

```

[here]: https://github.com/makersacademy/airport_challenge
