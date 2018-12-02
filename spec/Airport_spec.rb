require "Airport.rb"
# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport
# and confirm that it is no longer in the airport

describe Airport do
  plane = Plane.new
  it 'can instruct a plane to takeoff' do
    subject.land(plane)
    expect(subject.takeoff(plane)).is_a? Plane
  end
  it "can confirm plane has left airport" do
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.planes.empty?).to be true
  end
end
