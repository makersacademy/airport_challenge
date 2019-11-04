require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do
  it { is_expected.to be_instance_of(Airport) }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:takeoff) }

  it "expects that takeoff method returns plane object" do
    expect(subject.takeoff).to be_instance_of(Plane)
  end

  it "expects that error raised when landing attempted at full airport" do
    expect{ 2.times { subject.land(Plane.new) } }.to raise_error(RuntimeError)
  end

  it "expects that new airport with no arguments passed has default capacity" do
    expect(subject.capacity).to eq(subject::DEFAULT_CAPACITY)
  end

  it "expects that capacity can be overridden by passing argument when initialising airport" do
    custom_capacity = 5
    airport = Airport.new(custom_capacity)
    expect(airport.capacity).to eq(custom_capacity)
  end
end
