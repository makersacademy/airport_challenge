require "Airport.rb"

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport
# and confirm that it is no longer in the airport

describe Airport do

  plane = Plane.new
  it 'can instruct a plane to takeoff' do
    subject.land(plane, "clear")
    expect(subject.takeoff(plane, "clear")).is_a? Plane
  end
  it "can confirm plane has left airport" do
    subject.land(plane, "clear")
    subject.takeoff(plane, "clear")
    expect(subject.planes.empty?).to be true
  end
  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy
  it 'does not allow plane to take off, when stormy' do
    expect { subject.takeoff(plane, "stormy") }.to raise_error("#{plane} Cannot take off")
  end
  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy
  it 'does not allow plane to land, when stormy' do
    expect { subject.land(plane, "stormy") }.to raise_error("#{plane} Cannot land")
  end
end
