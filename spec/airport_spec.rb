require 'airport'
require 'plane'

describe Airport do
  it "allows ATC to instruct a plane to land" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.capacity).to eq(4)
  end

  it "allows ATC to instruct a plane to take off" do
    plane = Plane.new
    subject.take_off(plane)
    expect(subject.capacity).to eq(6)
  end

  it "prevents landing when the airport is full" do
    airport = Airport.new(0)
    plane = Plane.new
    expect { airport.land(plane) }.to raise_error
  end
end
