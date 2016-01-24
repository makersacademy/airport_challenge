require 'plane'
require 'airport'
require 'weather'

describe "Feature Test" do

  let(:weather) { double :weather, condition: "sunny"}

  it "returns array of 20 planes succesfully landed" do
    airport = Airport.new
    array = []
    20.times { array << Plane.new.land(airport, weather) }
    expect(airport.planes).to eq array
  end

  it "lands 15, takes off 7, reports 8 planes at the airport" do
    airport = Airport.new
    array = []
    15.times { array << Plane.new.land(airport, weather)}
    array[0..6].each {|x| x.takeoff(airport, weather)}
    expect(airport.planes.count).to eq 8
  end
end