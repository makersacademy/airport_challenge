require_relative "../lib/airport"
describe Airport do
  it { is_expected.to respond_to :land }
  it "responds to landing a plane with 1 argument" do
    expect(subject).to respond_to(:land).with(1).argument
  end
  it "responds to landing a plane at the airport" do
    plane = Plane.new
    expect(subject.land(plane)).to include(plane)
  end
  it { is_expected.to respond_to :takeoff }
  it "responds to a plane taking off" do
    expect(subject.takeoff).to eq(nil)
  end

  it "Confirm that a plane is no longer in the airport after take off - land 2 planes and take off 1" do
    2.times { subject.land(Plane.new) }
    subject.takeoff
    expect(subject.planes.length).to be 1
  end

  it "Confirm that a plane is no longer in the airport after take off - land 1 plane and then take it off" do
    subject.land(Plane.new)
    subject.takeoff
    expect(subject.planes).to be_empty
  end

  it "Prevents a plane landing when the airport is full" do
    10.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error("Airport is full")
  end

  it "Returns the capacity" do
    expect(subject.capacity).to eq Airport::CAPACITY
  end
end
