require 'airport'
require 'plane'

describe Airport do
  it "can make a new instance of Airport class" do
    expect(Airport.new).to be_an_instance_of(Airport)
  end

  it "responds to land function in Airport class" do
    airport = Airport.new
    expect(airport).to respond_to(:land)
  end

  it "land function takes one argument" do
    airport = Airport.new
    expect(airport).to respond_to(:land).with(1).argument
  end

  it "returns true if plane has landed" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq(true)
  end

  it "responds to take_off method in Airport class" do
    airport = Airport.new
    expect(airport).to respond_to(:take_off)
  end
end
