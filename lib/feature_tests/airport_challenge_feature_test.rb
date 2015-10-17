
# As an air traffic controller
# So planes can land safely at my airport
# I would like to instruct a plane to land

# airport1 = Airport.new returns airport object
# plane1 = Plane.new returrns plane object
# airport1.lands(plane1) returns plane object
require './lib/airport'
require './lib/weather'


puts "new airport "
p airport1 = Airport.new
puts "new plane "
p plane1 = Plane.new
puts "airport lands plane"
p airport1.lands(plane1)

# As an air traffic controller
# So planes can take off safely from my airport
# I would like to instruct a plane to take off

# airport1.takes_off(plane1) returns plane1

puts "airport takes_off a plane"
p airport1.takes_off(plane1)

# As an air traffic controller
# So that I can avoid collisions
# I want to prevent airplanes landing when my airport if full

# airport2 = Airport.new responds with airport object with default capacity
# airport2.lands(plane1) either responds with plane object or error that airport is full.
begin
  puts "land planes to capacity"
  Airport::DEFAULT_CAPACITY.times { airport1.lands(Plane.new) }
  puts "land another plan to see if get airport full error"
  p airport1.lands(Plane.new)
rescue Exception => e
  puts "raised error: #{e}"
end

# As an air traffic controller
# So that I can avoid accidents
# I want to prevent airplanes landing or taking off when the weather is stormy

# airport1.weather_good?(Weather.new.current) returns true if weather not stormy
# airport1.lands(plane1) returns "cannot land as weather stormy try again later"
begin
  puts "check weather then try to land and take-off plane"
  p airport2 = Airport.new
  now_weather = "stormy"
  p now_weather
  p airport2.weather_good?(now_weather)
  p airport2.lands(plane1)
  p airport2.takes_off(plane1)
rescue Exception => e1
  puts "raised error: #{e1}"
end

begin
  puts "check weather then try to land and take-off plane"
  p airport4 = Airport.new
  now_weather = "stormy"
  p now_weather
  p airport4.weather_good?(now_weather)
  p airport4.takes_off(plane1)
  p airpor4.lands(plane1)
rescue Exception => e1
  puts "raised error: #{e1}"
end

begin
  puts "check weather then try to land and take-off plane"
  puts "new airport"
  p airport3 = Airport.new
  now_weather = Weather.new.current
  p now_weather
  p airport3.weather_good?(now_weather)
  p airport3.lands(plane1)
  p airport3.takes_off(plane1)
  rescue Exception => e2
  puts "raised error: #{e2}"
end

begin
    puts "new airport"
    p airport4 = Airport.new
    now_weather = "sunny"
    p now_weather
    p airport4.weather_good?(now_weather)
    p airport4.lands(plane1)
    p airport4.takes_off(plane1)
    rescue Exception => e3
  puts "raised error: #{e3}"
end

# As an air traffic controller
# So that I can ensure safe take off procedures
# I want planes only to take off from the airport they are at
begin
  p airport5 = Airport.new
  p plane2 = Plane.new
  puts "landing a plane at airport returns planes at airport"
  airport5.lands(plane2)
  puts "plane taking off from airport returns plane that takes off"
  airport5.takes_off(plane2)
  puts "plane taking off that not at airport returns error"
  airport5.takes_off(plane2)
rescue Exception => e4
  puts "raised error: #{e4}"
end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

airport5 = Airport(7)
airport5.capacity = 10
10.times {airport5.lands(Plane.new)}








