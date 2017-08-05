require 'airport'
require 'plane'

describe Airport do
  it "has a capacity of 100 when capcity not specified" do
    airport = Airport.new
    airport.stub(:get_weather => :sunny)
    expect(airport.capacity).to eq 100
  end

  it "registers when a plane lands" do
    airport2 = Airport.new
    airport2.stub(:get_weather => :sunny)
    plane2 = Plane.new
    plane2.land(airport2)
    expect(airport2.planes).to eq 51
  end

  it "registers when a plane leaves" do
    airport3 = Airport.new
    airport3.stub(:get_weather => :sunny)
    plane3 = Plane.new(airport3)
    plane3.take_off(airport3)
    expect(airport3.planes).to eq 49
  end
end
