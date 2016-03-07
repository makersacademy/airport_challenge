require './lib/airport'
require './lib/plane'
require './lib/weather'

makers_international = Airport.new(Weather.new,5)
bigcity_airport = Airport.new(Weather.new,120)
southpole_airport = Airport.new(Weather.new,40)

makers_international.wait_for_weather :sunny
bigcity_airport.wait_for_weather :sunny
southpole_airport.wait_for_weather :sunny

planes = Array.new(5) {Plane.new makers_international}
planes += Array.new(9) {Plane.new}
planes += Array.new(10) {Plane.new bigcity_airport}

puts "#{makers_international.list_airplanes.size} planes at makers's"
puts "They are:" , makers_international.list_airplanes

puts "We also have some other airplanes, some in the air some in airports."
puts "\n\nnow doing some flight paths\n"
planes.each do |plane|
  plane.stationed_at?.launch_airplane plane unless plane.airborne?
  puts "plane #{plane} has departed!"
end

srand
4.times do
  makers_international.land_airplane planes.delete_at(rand(planes.size-1))
end
7.times do
  southpole_airport.land_airplane planes.delete_at(rand(planes.size-1))
end
9.times do
  bigcity_airport.land_airplane planes.delete_at(rand(planes.size-1))
end

puts "Most plane landed. let's take a look at who' still flying"
puts planes
puts "\nNow another dump, the lucky few that got to land at makers"
puts makers_international.list_airplanes
puts "And let's check their status"
makers_international.list_airplanes.each do |plane|
  puts "plane flying? #{plane.airborne?} | plane is at #{plane.stationed_at?}"
end

puts "Oh, looks like southpole_airport is getting some stormy weather"
southpole_airport.wait_for_weather :stormy
puts "Tobenna's private jet still want to depart. Let's give it a try"

begin
southpole_airport.launch_airplane southpole_airport.list_airplanes.first
rescue Exception => message
  puts "well I'm an exception, and the message is #{message}"
end
puts "\n\n\nthis is the end of this test. goodnight."
