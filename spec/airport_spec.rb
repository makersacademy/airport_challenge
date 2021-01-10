require 'airport'

describe Airport do

  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  it "instructs a plane to land at an airport" do
    expect(subject).to respond_to(:land).with(1).arguments
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  # COMPONENTS -> 1. Plane must be in airport; #2. Plane can take off from airport;
  # 3. Confirm plane no longer in airport
  it "holds a plane in an airport once it has landed" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to eq plane
  end

  it "instructs a plane to take off from an airport" do
    expect(subject).to respond_to(:take_off)
  end

  it "confirms plane no longer in airport" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off).to eq plane
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full
  it "raises an error if the airport is full" do
    plane = Plane.new
    subject.land(plane)
    expect { subject.land(Plane.new) }.to raise_error "Airport is full, plane cannot be landed."
  end
end
