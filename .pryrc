require "./lib/plane.rb"
require "./lib/weather.rb"
require "./lib/airport.rb"

def make_airport(name)
  Airport.new(name)
end

def make_plane
  Plane.new
end

paris = make_airport("Paris")
london = make_airport("London")
frankfurt = make_airport("Frankfurt")

plane_1 = make_plane
plane_2 = make_plane
plane_3 = make_plane
plane_4 = make_plane
plane_5 = make_plane

puts "You have 5 planes: plane_1, plane_2, plane_3, plane_4, plane_5"
puts "and 3 airports: paris, london, frankfurt"
