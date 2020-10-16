require 'plane'

RSpec.describe Plane do

  it "lands at an airport" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(airport.landed_planes.include?(plane)).to eq true
  end

  it "takes off from an airport" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    plane.take_off(airport)
    expect(airport.landed_planes.include?(plane)).to eq false
  end




end
