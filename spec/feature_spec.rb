require 'plane'
require 'airport'
require 'weather'

describe "feature testing" do
  let(:weather) { double :weather, condition: "sunny"}


  it "15 land & 7 take off successfully, reports back 8 planes grounded" do
    airport = Airport.new
    array = []
    15.times {array << Plane.new.land(airport, weather)}
    expect(airport.planes.count).to eq 15
    array[0..6].each {|x| x.takeoff(airport, weather)}
    expect(airport.planes.count).to eq 8
  end

  it "errors landing 21st plane, increase capacity, 21st plane lands ok" do
    airport = Airport.new
    expect(airport.planes.count).to eq 0
    20.times { Plane.new.land(airport, weather)}
    expect do
      Plane.new.land(airport, weather)
    end.to raise_error("Can't land when airport is at capacity")
    airport.capacity = 25
    Plane.new.land(airport, weather)
    expect(airport.planes.count).to eq 21
    expect(airport.capacity).to eq 25
  end

end