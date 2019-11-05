require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do
  it { is_expected.to be_instance_of(Airport) }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:takeoff).with(1).argument }

  it "expects that error raised when landing attempted at full airport" do
    expect{ (subject.capacity + 1).times { subject.land(Plane.new) } }.to raise_error(RuntimeError)
  end

  it "expects that new airport with no arguments passed has default capacity" do
    expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  it "expects that capacity can be overridden by passing argument when initialising airport" do
    custom_capacity = 5
    airport = Airport.new(custom_capacity)
    expect(airport.capacity).to eq(custom_capacity)
  end

  it "returns error when plane tries to takeoff from airport it's not at" do
    plane = Plane.new
    expect{ subject.takeoff(plane) }.to raise_error(RuntimeError)
  end
end
