require './lib/plane.rb'
require './lib/airport.rb'

#--------
# setup
#--------


def flying_planes(number)
  planes = []
  number.times do
    planes << Plane.new
    planes.last.take_off
  end
  planes
end

# create an airport
airport = Airport.new

# fill the airport with flying planes using .land
Airport::DEFAULT_CAPACITY.times do
  plane = Plane.new
  plane.take_off
  airport.land(plane)
end

#--------
# operation
#--------

# set airport open: good weather
airport.closed = false

#instruct plane to take off
plane = airport.take_off

#check that plane has taken off
puts "Plane has taken off: #{plane.flying?}"                         #=> true

#check that plane is no longer in the airport
puts "Plane is no longer in airport: #{!airport.include?(plane)}"               #=> false

#instruct plane to land
airport.land(plane)

#check that plane has landed
puts "Plane has landed: #{!plane.flying?}"                         #=> false

# check that plane is in the airport
puts "Plane is in airport: #{airport.include?(plane)}"               #=> true

# set airport closed: bad weather
airport.closed = true

#instruct plane to take off - expect an error
begin
  plane = airport.take_off
rescue
  puts "Bad weather, plane cannot take off"
end

#check whether plane has taken off
puts "Plane is flying #{plane.flying?}"


# instruct plane to land when airport closed - expect an error
begin
  airport.land(Plane.new)
rescue
  puts "Bad weather, plane cannot land"
end

#--------
# setup
#--------

# set airport open
airport.closed = false
# empty airport
airport.send(:planes).count.times {plane = airport.take_off}


# fill airport to capacity
# fill the airport with flying planes using .land
Airport::DEFAULT_CAPACITY.times do
  plane = Plane.new
  plane.take_off
  airport.land(plane)
end

#--------
# operation
#--------

# try and land another plane - should generate an error
begin
  airport.land(Plane.new)
rescue
  puts "Airport full, plane cannot land"
end

#--------
# random weather testing
#--------

puts "=============================="

BAD_WEATHER_INDEX = 0.25

prng = Random.new
heathrow = Airport.new
planes_to_land = []
planes_taken_off = []


while true
  heathrow.closed = prng.rand(1.0) < BAD_WEATHER_INDEX

  puts "Heathrow closed for landing due to bad weather" if heathrow.closed?

  new_planes = prng.rand(10)
  planes_to_land.concat(flying_planes(new_planes))
  puts "#{new_planes} new planes in airspace. Total #{planes_to_land.count} waiting to land"

  until planes_to_land.empty?
    begin
      heathrow.land(planes_to_land.last)
      planes_to_land.pop
    rescue => e
      puts "...#{e.message}"
      break
    end
  end

  heathrow.closed = prng.rand(1.0) < BAD_WEATHER_INDEX
  puts "Heathrow closed for take off due to bad weather" if heathrow.closed?

  until heathrow.send(:planes).empty?
    begin
      planes_taken_off << heathrow.take_off
    rescue => e
      puts "...#{e.message}"
      break
    end
  end

  puts "#{planes_to_land.count} planes waiting to land"
  puts "#{planes_taken_off.count} taken off"
  puts "#{heathrow.send(:planes).count} planes on the ground"

  puts "..."

  break if gets.chomp=="end"
end
