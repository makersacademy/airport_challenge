require 'plane'

RSpec.describe Plane do

  it "lands at an airport" do
    Airport.any_instance.stub(:stormy?) {false}
    Airport.any_instance.stub(:full?) {false}
    airport = Airport.new
    plane = Plane.new
    plane.land(airport)
    expect(airport.landed_planes.include?(plane)).to eq true
  end

  it "takes off from an airport and confirms" do
    Airport.any_instance.stub(:stormy?) {false}
    Airport.any_instance.stub(:full?) {false}
    airport = Airport.new
    plane = Plane.new
    plane.land(airport)
    expect(plane.take_off(airport)).to be_a(String)
    plane.take_off(airport)
    expect(airport.landed_planes.include?(plane)).to eq false
  end

  it "does not land if airport is full" do
    Airport.any_instance.stub(:stormy?) {false}
    airport = Airport.new(1)
    plane1 = Plane.new
    plane2 = Plane.new
    plane1.land(airport)
    expect{plane2.land(airport)}.to raise_error
  end



end
