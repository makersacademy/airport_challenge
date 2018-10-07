require_relative '0_dependencies'

puts "Airport initilaized"
puts  a1 = Airport.new
puts "airport checks weather to see if clear to fly"
puts  a1.flight_clearance?
