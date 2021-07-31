require "airport"

describe Airport do  
  it "has room for planes to land" do
    expect(subject.hanger).to eq []
  end

  it "accepts landings with #land" do
    expect(subject).to respond_to :land
  end

  it "allows 1 plane to land at a time" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "raises an exception if no plane is specified for landing" do
    expect { subject.land() }.to raise_exception(ArgumentError)
  end

  it "allows a plane to #take_off" do
    expect(subject).to respond_to :take_off
  end

  it "allows 1 plane to take off at a time" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "removes a plane from it's hanger when plane takes off" do
    test_plane = Plane.new
    subject.land(test_plane)
    expect(subject.take_off(test_plane)).to eq test_plane
    expect(subject.hanger).to eq []
  end

  it "raises an exception if no plane is specified for take off" do
    expect { subject.take_off() }.to raise_error(ArgumentError)
  end
end
