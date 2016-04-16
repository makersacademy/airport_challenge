airport = Airport.new
plane = Plane.new

plane.landing_status

airport.land(plane)

plane.landing_status

airport.take_off(plane)

plane.landing_status

# weather generator

airport = Airport.new

airport.weather.weather_generator
