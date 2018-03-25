require './airport.rb'

p gatwick = Airport.new
p plane = Plane.new
p gatwick.land(plane)
p gatwick.takeoff(plane)



# p weather = Weather.new
# p weather.outlook
# p weather.weather_generator
#
# p plane = Plane.new
# p plane.land("good","airport")

# sleep 1
#
# p plane = Plane.new
# p plane.takeoff("good", "airport")
#
# sleep 1
#
# p plane = Plane.new
# p plane.takeoff "stormy", "airport"
#
# sleep 1
#
# p plane = Plane.new
# p plane.land "stormy", "airport"
#
# sleep 1
#
# p plane = Plane.new
# p plane.takeoff Weather.new.outlook, "airport"
#
# sleep 1
#
# p plane = Plane.new
# p plane.land Weather.new.outlook, "airport"
