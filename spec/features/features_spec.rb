require "airport.rb"
require "plane.rb"
require "weather.rb"

describe "land and takes" do
  let(:weather) { double :weather, stormy?: false }
  
  p1 = Plane.new
  p2 = Plane.new
  p3 = Plane.new
  p4 = Plane.new
  p5 = Plane.new
  p6 = Plane.new
  a = Airport.new(5)
  p1.land(a)
  p2.land(a)
  p3.land(a)
  p4.land(a)
  p5.land(a)
  p2.take_off(a)
  p6.land(a)
end
