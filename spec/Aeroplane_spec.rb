
require "Aeroplane.rb"

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

describe "Plane" do
subject(:plane) { Plane.new }

it 'Can receive #land' do
  allow(plane).to receive(:land)
end
end
