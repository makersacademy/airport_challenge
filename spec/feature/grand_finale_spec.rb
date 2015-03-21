require 'capybara/rspec'
require 'weather.rb'
require 'airport.rb'
require 'plane.rb'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do
  xscenario 'all planes can land and all planes can take off'
end

# airport = Airport.new
# weather = Weather.new
# airport.weather(weather.weather)
# plane = Plane.new
# ATC = AirTrafficControl.new
# push 6 planes to AirTrafficControl
# push an airport to AirTrafficControl
# if the weather in the airport is stormy
# reroute the planes to a new instance of airport
