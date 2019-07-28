require_relative '../lib/airplane.rb'

puts "CREATING AIRPLANE:"
first_airplane = Airplane.new
puts first_airplane.location

puts "LANDING AIRPLANE:"
first_airplane.land_plane
puts first_airplane.location

puts "TAKING OFF AIRPLANE:"
first_airplane.take_off
puts first_airplane.location
