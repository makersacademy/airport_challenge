require_relative './lib/airport.rb'
require_relative './lib/plane.rb'
require_relative './lib/weather.rb'

airport = Airport.new
plane = Plane.new
weather = Weather.new

# p airport.land(plane)
# p

airport.land(plane)
p plane.flying
airport.take_off(plane)
p plane.flying
airport.weather_check?
airport.weather_check?
airport.weather_check?
airport.weather_check?
airport.weather_check?
airport.weather_check?
