require 'airport'
describe Airport do

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

  it "instructs a plane to land at an airport" do

  #arrange
  heathrow_airport = Airport.new
  boeing_plane = Plane.new

  #act
  boeing_plane.land(plane)

  #assert
  expect(airport).to respond_to(:planes_available?)
  end
end 
