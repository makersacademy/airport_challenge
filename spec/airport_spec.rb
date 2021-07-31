require "airport"

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
describe Airport do
  it { is_expected.to respond_to :land }
end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

describe '#land(plane)' do
  it "instructs a plane to land at an airport" do
    airport = Airport.new
    plane = Plane.new
  end
end