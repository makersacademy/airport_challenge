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

  it "adds plane to plane_storage if plane has landed" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq([plane])
  end

  it "responds to take_off method in Airport class" do
    airport = Airport.new
    expect(airport).to respond_to(:take_off)
  end

  it "take_off function takes one argument" do
    airport = Airport.new
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it "take_off method takes last plane from plane_storage array" do
    airport = Airport.new
    plane = Plane.new
    plane2 = Plane.new
    airport.land(plane)
    airport.land(plane2)
    expect(airport.take_off(plane)).to eq(plane)
  end

  it "raises error if airport has reached capacity of landed planes" do
    airport = Airport.new
    5.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error("Error: Max capacity for planes in Airport has been reached.")
  end

  it "should have 1 argument when instantiated" do
    expect { Airport.new(10) }.not_to raise_error
  end


end
