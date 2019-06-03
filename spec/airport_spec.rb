require 'airport'
require 'plane'

describe Airport do

  it 'tells a plane to land' do
    airport = Airport.new
    expect(airport).to respond_to(:land).with(1).argument
  end
  it "adds a new plane to hangar" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.hangar).to include(plane)
  end

  it "instructs a plane to take off" do
    airport = Airport.new
    expect(airport).to respond_to(:take_off).with(1).argument
  end
  it "removes plane once taken off" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.hangar).not_to include(plane)
  end
  it "Take off confirmation" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.take_off(plane)).to eq("Airborne!")
  end
  it "raises error when no planes at airport" do
    expect { subject.take_off(plane) }.to raise_error 'No planes available'
  end
end
