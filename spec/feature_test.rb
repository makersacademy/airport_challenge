Dir[__dir__ + '/lib/*.rb'].each { |file| require file }
plane1 = Plane.new("Air Force One")
airport1 = Airport.new("JFK Airport")

plane1.land(airport1, plane1)
plane1.take_off(airport1, plane1)
