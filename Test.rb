require_relative "./lib/airport.rb"
require_relative "./lib/plane.rb"
require_relative "./lib/weather.rb"

current_weather = Weather.new
new_plane = Plane.new(true)
new_airport = Airport.new

new_plane.land_at_airport(new_airport, current_weather)
new_plane.land_at_airport(new_airport, current_weather)
new_plane.takeoff_from_airport(new_airport, current_weather)