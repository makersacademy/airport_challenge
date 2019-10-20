require 'airport'
require 'plane'

describe Airport do
  it "lands a plane at an airport" do
    plane = Plane.new
    expect { subject.land(plane) }.not_to raise_error
  end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that
# it is no longer in the airport

  it "allows a plane to take off, and to confirm it's not in the airport" do
    expect(subject.take_off).to eq "Plane has left airport."
  end

end
