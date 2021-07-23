require 'airport'
require 'plane'

describe Airport do
  let(:plane) {Plane.new}
  let(:airport) {Airport.new(20)}

  it "Should instruct the plane to land" do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it "Should instruct the plane to take off" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it "Take off method should confirm that plane has left Hangar" do
    plane = Plane.new
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.hangar).to be_empty
  end

  it "Airport prohibits landing when at maximum capacity" do
    plane = Plane.new
    20.times do
      airport.land(plane)
    end
    expect{ airport.land(plane) }.to raise_error "Cannot land plane, this Airport is full."
  end

  it "All airports should have a default capacity" do
    airport = Airport.new()
    Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error "Cannot land plane, this Airport is full."
  end

  it "Random weather generator works as expected" do
    expect(airport).to respond_to(:random_weather)
  end
end