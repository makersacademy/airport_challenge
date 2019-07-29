require_relative "../lib/airport.rb"
require_relative "../lib/weather.rb"
require_relative "../lib/plane.rb"

british_weather = Weather.new(0) # chance of being stormy.

gatwick = Airport.new(british_weather, 5) # airport should have a capacity and a weather system
southend = Airport.new(british_weather) # airport with a default capacity.

puts gatwick.planes # expect []
puts gatwick.capacity # expect Airport::DEFAULT_CAPACITY
puts southend.planes # expect []

pl0 = Plane.new # leave name empty for now

gatwick.land(pl0)

puts gatwick.planes.count # should be 1

begin
  gatwick.land(pl0)
rescue StandardError
  puts "same plane unable to be landed twice. Great Success"
else
  raise "Two planes exist at the airport."
end

begin
  southend.land(pl0)
rescue StandardError
  puts "Unable to land plane at different airport"
else
  raise "one plane at two airports."
end
