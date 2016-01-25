require 'plane'
require 'airport'
require 'weather'

describe "Feature Test" do

  let(:weather) { double :weather, condition: "sunny"}

  it "lands 20 planes, then returns error when capacity is full" do
    airport = Airport.new
    array = []
    20.times { array << Plane.new.land(airport, weather) }
    expect do
      Plane.new.land(airport, weather)
    end.to raise_error("Can't land when airport is at capacity")
  end

  it "lands 15, takes off 7 and lands another 12" do
    airport = Airport.new
    array = []
    15.times { array << Plane.new.land(airport, weather)}
    array[0..6].each {|x| x.takeoff(airport, weather)}
    11.times { array << Plane.new.land(airport, weather)}
    plane = Plane.new
    expect(plane.land(airport, weather)).to eq plane
  end
end