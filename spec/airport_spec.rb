# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
require 'airport'
describe Airport do
  it "Expects Airport to respond to landing a plane" do
    expect(subject).to respond_to(:land)
  end
end
