require './lib/airport.rb'
require './lib/plane.rb'
puts "check planes can only take off from airports they are in"
heathrow = Airport.new
gatwick = Airport.new
airbus = Plane.new
boeing = Plane.new
heathrow.land(airbus)
p heathrow
gatwick.land(boeing)
p gatwick
puts "request take off of boeing from heathrow"
heathrow.take_off(boeing)
p heathrow
p gatwick
puts "request take off of airbus from heathrow"
heathrow.take_off(airbus)
p heathrow
p gatwick
