require './docs/airport'

describe Airport do
  let(:airport) { Airport.new }

  context "Initialize"
  it "Capacity of airport should be 20 by default if no arguments passed in" do
    expect(airport.capacity).to eq(20)
  end

  it "Capacity of airport should be able to be customized" do
    airport.capacity = 10
    expect(airport.capacity).to eq(10)
  end

  it "Planes array should be an empty array by default" do
    expect(airport.planes).to eql([])
  end

  context "Plane landing"
  it "Plane should be able to land and be added to @planes array" do
    expect(airport.landing).to be_instance_of(Array)
  end

  it "Plane should not be able to land because airport is full" do
    airport.capacity = 4
    4.times { airport.landing }
    expect { airport.landing }.to raise_error "Airport is full!"
  end

  context "Plane taking off"
  it "Plane should be able to take off" do
    allow(airport).to receive_messages(:weather => "Clear")
    expect(airport.landing).to be_instance_of(Array)
  end

  it "Plane should not be able to take off due to stormy weather" do
    allow(airport).to receive_messages(:weather => "Stormy")
    expect { airport.take_off }.to raise_error "Plane cannot take off due to stormy weather"
  end

  it "A plane should be taken off the @planes array once it takes off" do
    allow(airport).to receive_messages(:weather => "Clear")
    2.times { airport.landing }
    airport.take_off
    expect(airport.planes.size).to eq(1)
  end
end
