require 'plane'
require 'airport'
require 'weather'

describe "feature testing" do
  let(:weather) { double :weather, :condition => "sunny"}

  it "lands 15 planes and takes off 7 in good condition, reports back 8 planes grounded" do
    airport = Airport.new
    array = []
    15.times {array << Plane.new.land(airport, weather)}
    array[0..6].each {|x| x.takeoff(airport, weather)}
    expect(airport.planes.count).to eq 8
  end

end