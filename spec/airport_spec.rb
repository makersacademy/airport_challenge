require_relative "../lib/airport.rb"

describe Airport do

  DEFAULT_CAPACITY = 50

  it "capacity has a default of 50." do
    expect(subject.capacity).to eq DEFAULT_CAPACITY
  end

  it "capacity can be overriden as appropiate. Given capacity of 20." do
    expect(Airport.new(nil, 20).capacity).to eq 20
  end

  it "can park airplanes" do
    plane = Plane.new
    plane.departure
    subject.park(plane)
    expect(subject.planes_parked[0]).to eq plane
  end

  it "cannot park more planes than the default capacity" do
    DEFAULT_CAPACITY.times { subject.park(Plane.new.departure) }
    expect { subject.park(Plane.new.departure) }.to raise_error("Airport is full")
  end

end
