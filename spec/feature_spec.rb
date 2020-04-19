require_relative '../lib/airports.rb'

puts "make the instances"

heathrow = Airport.new
puts "Heathrow = #{heathrow}"
gatwick = Airport.new
puts "gatwick = #{gatwick}"
boeing = Plane.new(heathrow)
puts "boeing = #{boeing}"
jumbo = Plane.new(gatwick)
puts "jumbo = #{jumbo}"

puts "boeing should be in heathrow = #{heathrow}"
puts boeing.location
puts "jumbo should be in gatwick = #{gatwick}"
puts jumbo.location

puts "both planes takeoff"
boeing.takeoff
jumbo.takeoff

puts "both planes land in the other airport"

boeing.land(gatwick)
jumbo.land(heathrow)

puts "Boeing location should be gatwick"
puts boeing.location
puts "Jumbo location should be heathrow"
puts jumbo.location

puts "heathrow hangar should include jumbo"
puts heathrow.hangar

puts "gatwick hangar should include boeing"
puts gatwick.hangar

puts "jumbo at heathrow, boeing at gatwick"

gatwick.weather_update(false)
