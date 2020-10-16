require_relative '../lib/plane.rb'
require_relative '../lib/airport.rb'
# feature test for the story number 4
# making a default airport of capacity 20

airport_default = Airport.new
puts airport_default.capacity
# making an airport with custom capacity
airport = Airport.new(5)

puts airport.capacity
