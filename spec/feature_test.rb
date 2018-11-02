require './lib/plane'
require './lib/airport'

p "Creates new Airport"
p airport1 = Airport.new
p "Creates new plane"
p plane1 = Plane.new
p "Changes the weather to stormy"
p airport1.weather.what_is_weather = 'stormy'

begin
  p "Shows plane cannot land while stormy"
  p plane1.land(airport1)
rescue('Cannot land in stormy weather')
  p "Cannot land while it's stormy"
else
  p "Plane somehow landed while stormy and everyone died"
end

p "Changes weather to sunny"
p airport1.weather.what_is_weather = 'sunny'
p "Lands plane at airport"
p plane1.land(airport1)
p "Shows plane in airport hangar"
p airport1.hangar
p "Changes weather to stormy"
p airport1.weather.what_is_weather = 'stormy'

begin
  p "Shows plane cannot take off while weather is stormy"
  p airport1.takeoff(plane1)
rescue('Cannot take off in stormy weather')
  p "Cannot take off while it's stormy"
else
  p "Plane somehow took off while stormy and everyone died"
end

p "Changes weather to sunny"
p airport1.weather.what_is_weather = 'sunny'
p "Makes the plane take off from the airport"
p airport1.takeoff(plane1)
p "Shows the plane has been removed from the hangar"
p airport1.hangar
