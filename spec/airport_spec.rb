require "airport"

describe Airport do  
  it "has room for planes to land" do
    expect(subject.hanger).to eq []
  end

  it "has a default capacity" do
    expect(subject.capacity).to eq 1
  end

  it "can be given a custom capacity" do 
    test_airport = Airport.new(42)
    expect(test_airport.capacity).to eq 42
  end

  it "accepts landings with #land" do
    expect(subject).to respond_to :land
  end

  it "allows 1 plane to land at a time" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "does not allow a plane to land if hanger is full" do # with capacity 1 
    test_plane = Plane.new
    subject.land(test_plane)
    expect { subject.land(test_plane) }.to raise_exception("Can't land, airport is full.")
    expect(subject.hanger.length).to eq 1
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
