require 'airport'
require 'plane'

describe Airport do
  subject(:airport) {described_class.new}
  it "has a capacity of 100 when capcity not specified" do
    airport.stub(:get_weather => :sunny)
    expect(airport.capacity).to eq 100
  end

  let(:plane2) { double{"plane2"}}
  it "registers when a plane lands" do
    airport.stub(:get_weather => :sunny)
    plane2 = Plane.new
    plane2.land(airport)
    expect(airport.planes).to eq 51
  end

  it "registers when a plane leaves" do
    airport.stub(:get_weather => :sunny)
    plane3 = Plane.new(airport)
    plane3.take_off(airport)
    expect(airport.planes).to eq 49
  end
end
