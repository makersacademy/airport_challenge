
# As an air traffic controller
# So planes can land safely at my airport
# I would like to instruct a plane to land

# airport1 = Airport.new returns airport object
# plane1 = Plane.new returrns plane object
# airport1.land(plane1) returns plane object
require './lib/airport'
require './lib/weather'
require './lib/traffic_control'


puts "new airport "
p airport1 = Airport.new
puts "new plane "
p plane1 = Plane.new
puts "airport land plane"
p airport1.land(plane1)

# As an air traffic controller
# So planes can take off safely from my airport
# I would like to instruct a plane to take off

# airport1.take_off(plane1) returns plane1

puts "airport take_off a plane"
p airport1.take_off(plane1)

# As an air traffic controller
# So that I can avoid collisions
# I want to prevent airplanes landing when my airport if full

# airport2 = Airport.new responds with airport object with default capacity
# airport2.land(plane1) either responds with plane object or error that airport is full.
begin
  puts "land planes to capacity"
  Airport::DEFAULT_CAPACITY.times { airport1.land(Plane.new) }
  puts "land another plan to see if get airport full error"
  p airport1.land(Plane.new)
rescue Exception => e
  puts "raised error: #{e}"
end

# As an air traffic controller
# So that I can avoid accidents
# I want to prevent airplanes landing or taking off when the weather is stormy

# airport1.weather_good?(Weather.new.current) returns true if weather not stormy
# airport1.land(plane1) returns "cannot land as weather stormy try again later"
begin
  puts "check weather then try to land and take-off plane"
  p airport2 = Airport.new
  now_weather = "stormy"
  p now_weather
  p airport2.weather_good?(now_weather)
  p airport2.land(plane1)
  p airport2.take_off(plane1)
rescue Exception => e1
  puts "raised error: #{e1}"
end

begin
  puts "check weather then try to land and take-off plane"
  p airport4 = Airport.new
  now_weather = "stormy"
  p now_weather
  p airport4.weather_good?(now_weather)
  p airport4.take_off(plane1)
  p airpor4.land(plane1)
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
  p airport3.land(plane1)
  p airport3.take_off(plane1)
  rescue Exception => e2
  puts "raised error: #{e2}"
end

begin
    puts "new airport"
    p airport4 = Airport.new
    now_weather = "sunny"
    p now_weather
    p airport4.weather_good?(now_weather)
    p airport4.land(plane1)
    p airport4.take_off(plane1)
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
  airport5.land(plane2)
  puts "plane taking off from airport returns plane that takes off"
  airport5.take_off(plane2)
  puts "plane taking off that not at airport returns error"
  airport5.take_off(plane2)
rescue Exception => e4
  puts "raised error: #{e4}"
end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

puts "Initialise airport with capcity of 7"
airport5 = Airport.new(7)
p 7.times {airport5.land(Plane.new)}
puts "set airport capacity to 10"
airport6 = Airport.new(6)
airport6.capacity = 10
p 10.times {airport6.land(Plane.new)}

# As an air traffic controller
# So the system is consistent and correctly reports plane status and location
# I want to ensure a flying plane cannot take off and cannot be in an airport

# verbs = land,take-off, ensure
# nouns = plane, aiport, system

# messages = fly, take-off, land
# objects = plane, airport, system

puts "new air traffic system ******"
p airtraffic1 = TrafficControl.new
puts "new airport"
p airport1 = Airport.new
begin
  puts "take-off plane while flying gives error"
  p airtraffic1.take_off(plane1,airport1)
rescue Exception => e5
  puts "error #{e5}"
end

puts "land plane1 at airport1 and set location and status"
p airport1.land(plane1)
p plane1.land(airport1)
puts "take-off plane that is on ground"
p airtraffic1.take_off(plane1,airport1)


# As an air traffic controller
# So the system is consistent and correctly reports plane status and location
# I want to ensure a plane that is not flying cannot land and must be in an airport

begin
  puts "land plane"
  p airtraffic1.land(plane1,airport1)
  puts "land plane that is not flying to get a error"
  p airtraffic1.land(plane1,airport1)
rescue Exception => e6
  puts "error #{e6}"
end
puts "check plane at airport"
p plane1.location



# responds with "plane not flying so cannot land" if plane not flying

# plane.location = airport1 not in-air











# airtraffic1.land(plane1,airport1) responds with plane location
# airport1.land(plane1)
# plane1.status = "not_flying"
# plane1.location = airport1






# airtraffic1.report(plane1)
# plane1.status
# plane1.location









