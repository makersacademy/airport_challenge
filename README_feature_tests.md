
#I want to create my two object , plane and airport

airport = Airport.new
plane = Plane.new

# I Want to land the plane and confirm that is
#landed

airport.land(Plane.new)
#I  want to departure the plane  

airport.takeoff

#Confirmation of both, landing and take off plane

airport.landing_confirmation
airport.takeoff_confirmation

# I want to prevent landing and departure when
#weather is stormy

weather = Weather.new
weather.stormy_weather?
airport.land Plane.new
airport.takeoff

#I want to prevent landing when terminal is full and
#to check if the airport is empty?

airport.full?
airport.empty?

#I initiated a default capacity for the airport

DEFAULT_CAPACITY = 50

50.times { airport.land(Plane.new)}
