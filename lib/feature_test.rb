require_relative 'airport'
require_relative 'aircraft'

empty_airport = Airport.new
full_airport = Airport.new
5.times { full_airport.aircrafts << 'aircraft' }
landed = Aircraft.new
landed2 = Aircraft.new
airbourne = landed2.change_status
p airbourne

# p empty_airport.instruct_landing landed
p empty_airport.landing airbourne
p airbourne.landed
p airbourne
