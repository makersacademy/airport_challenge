require 'airport'
describe Airport do
  subject(:airport) {described_class.new}

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

  it "instructs a plane to land at an airport" do
  #arrange
  heathrow_airport = Airport.new
  plane = Plane.new
  #act
  plane.land(plane)
  # assert
  expect(plane).to respond_to(:land)
  end

#As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  it "instructs a plane to take off from an airport" do
  #arrange
  airport = Airport.new
  plane = Plane.new
  #act
  plane.take_off(plane)
  #assert
  expect(plane).to respond_to(:take_off)
  end

end
