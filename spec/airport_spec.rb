require 'airport.rb'
require 'plane.rb'

describe Airport do
  it "responds to #takeoff" do
    airport = Airport.new
    expect(airport).to respond_to(:takeoff)
  end

  it "after #takeoff, confirms plane is not there" do
    airport = Airport.new
    airport.takeoff
    expect(airport.planes.count).to eq(0)
  end

  it "responds to #stormy?" do
    airport = Airport.new
    expect(airport).to respond_to(:stormy?)
  end

  it "doesn't takeoff if weather is stormy" do
    airport = Airport.new
    allow(airport).to receive(:stormy?) {true}
    expect{airport.takeoff}.to raise_error(RuntimeError)
  end

  it "responds to #land" do
    airport = Airport.new
    expect(airport).to respond_to(:land)
  end

  it "doesn't allow landings when full" do
    airport = Airport.new
    expect{airport.land}.to raise_error("Cannot land when airport is full")
  end
end
