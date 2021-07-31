require "airport"
require "plane"

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
describe Airport do
  it { is_expected.to respond_to :land }
end
# describe "#land(plane)" do
 # it "instructs a plane to land at an airport" do
 # plane = Plane.new
  # expect(airport.land(plane)).to eq 1
  # end
# end