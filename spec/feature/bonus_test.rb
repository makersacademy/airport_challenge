require_relative '../../lib/airport.rb'
require_relative '../../lib/plane.rb'
require_relative '../../lib/weather.rb'

LHR = Airport.new
GTW = Airport.new
Boeing747 = Plane.new
Spitfire = Plane.new
BiPlane = Plane.new
Lancashire = Plane.new
LHR.land(Spitfire)
puts "Planes landed at LHR are: #{LHR.landed}"
puts "Planes airborne from LHR are: #{LHR.flying}"
LHR.land(BiPlane)
puts "Planes landed at LHR are: #{LHR.landed}"
puts "Planes airborne from LHR are: #{LHR.flying}"
LHR.land(Lancashire)
puts "Planes landed at LHR are: #{LHR.landed}"
puts "Planes airborne from LHR are: #{LHR.flying}"
LHR.take_off(Lancashire)
puts "Planes landed at LHR are: #{LHR.landed}"
puts "Planes airborne from LHR are: #{LHR.flying}"
