require_relative 'lib/plane'
require_relative 'lib/airport'
require_relative 'lib/weather'

puts "***Attempt to land a plane at an airport***"
puts "	Initializing a plane..."
plane = Plane.new
puts "	Initializing an airport with a weather object..."
airport = Airport.new
puts "	Checking plane is not already landed..."
puts "	Plane landed?: #{plane.landed?}"
puts "	Attempting to land the plane at the airport..."
puts plane.try_to_land(airport)
puts "***Check plane is landed***"
puts "	Plane landed?: #{plane.landed?}"
puts "***Attempt to fly plane***"
puts plane.try_to_takeoff
puts "***Check plane is not landed***"
puts "	Plane landed?: #{plane.landed?}"
puts "	Plane in airport?: #{airport.landed.include?(plane)}"
puts "***Check planes don't land in bad weather by trying to land 100 planes***"
airport = Airport.new(100)
100.times do
	plane = Plane.new
	plane.try_to_land(airport)
end
puts "	Planes successfully landed: #{airport.landed.length}"
puts "***Check planes don't take off in bad weather by trying to fly all of the planes in the airport***"
i = 0
length = airport.landed.length
until i == length
	airport.landed[i].try_to_takeoff
	if airport.landed.length < length
		length -= 1
	else
		i += 1
	end
end
puts "	Planes still in the airport: #{airport.landed.length}"
puts "***Check planes can't land if the airport is full***"
puts "	Use the default capacity of 10"
airport = Airport.new
puts "	Land planes at the airport until the airport has 10 planes"
until airport.landed.length == 10
	plane = Plane.new
	plane.try_to_land(airport)
end
puts "	Then try to land a plane"
plane = Plane.new
puts plane.try_to_land(airport)
puts "***Check you can set a different capacity when creating an airport***"
puts "	Set the capacity to 20"
airport = Airport.new(20)
puts "	Land planes until the airport has 20 planes"
until airport.landed.length == 20
	plane = Plane.new
	plane.try_to_land(airport)
end
puts "	Then try to land a plane"
plane = Plane.new
puts plane.try_to_land(airport)
puts "	Let two planes fly"
i = 0
until airport.landed.length == 18
	if airport.landed[i].try_to_takeoff == "Plane has successfully departed..."
	else
		i += 1
	end
end
puts "	Land planes again until capacity is reached"
until airport.landed.length == 20
	plane = Plane.new
	plane.try_to_land(airport)
end
puts "	Then try to land a plane"
plane = Plane.new
puts plane.try_to_land(airport)
puts "***Check that airport cannot expand!"
puts "Try to run airport.capacity=1000"
begin
airport.capacity = 1000
rescue NoMethodError => e
	puts e
end
puts "***Check that planes already flying cannot take off***"
plane = Plane.new
airport = Airport.new
until plane.landed?
	plane.try_to_land(airport)
end
until plane.landed? == false
	plane.try_to_takeoff
end
puts "	Plane location: #{plane.location}"
puts " 	Plane landed?: #{plane.landed?}"
puts "	Try to fly plane..."
puts plane.try_to_takeoff
puts "	Airport contains plane?: #{airport.landed.include?(plane)}"
puts "***Check that planes already landed cannot be landed***"
plane = Plane.new
airport = Airport.new
until plane.landed?
	plane.try_to_land(airport)
end
puts "	Plane location: #{plane.location}"
puts " 	Plane landed?: #{plane.landed?}"
puts "	Try to land plane at a different airport"
puts plane.try_to_land(Airport.new)

