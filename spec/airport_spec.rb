require './docs/airport'

describe Airport do
  context "Initialize"

  it "Capacity of airport should be 20 by default if no arguments passed in" do
    expect(subject.capacity).to eq(20)
  end

  it "Capacity of airport should be able to be customized" do
    airport = Airport.new(10)
    expect(airport.capacity).to eq(10)
  end

  it "Planes array should be an empty array by default" do
    expect(subject.planes).to eql([])
  end

  context "Plane landing"

  it "Plane should be able to land and be added to @planes array" do
    expect(subject.landing).to be_instance_of(Array)
  end

  it "Plane should not be able to land because airport is full" do
    airport = Airport.new(4)
    4.times { airport.landing }
    expect { airport.landing }.to raise_error "Airport is full!"
  end

  context "Plane taking off"
  it "Plane should be able to take off" do
    expect(subject.landing).to be_instance_of(Array)
  end

  let (:Weather) { double :Weather }

  it "Plane should not be able to take off due to stormy weather" do
    Weather.status = "Stormy"
    expect { subject.take_off }.to raise_error "Plane cannot take off due to stormy weather"
  end

  it "Plane should be taken off the @planes array once it takes off" do
  end
end
