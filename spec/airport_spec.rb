require 'airport'

describe Airport do
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  it "can instruct plane to land" do
    expect(subject).to respond_to(:land).with(1)
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it "can instruct plane to take off" do
    expect(subject).to respond_to(:take_off)
  end

  it "can store plane" do
    expect(subject.land(Plane.new)).to eq subject.planes
  end

  it "can confirm plane has left" do
    subject.land(Plane.new)
    expect(subject.take_off).to eq []
  end



end
