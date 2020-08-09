# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

require 'airport'
describe Airport do
  it "Expects Airport to respond to landing a plane" do
    expect(subject).to respond_to(:land)
  end

  it "Expects Plane to respond to land" do
    airport = Airport.new
    plane = Plane.new
    expect(plane).to respond_to(:land)
  end
end
