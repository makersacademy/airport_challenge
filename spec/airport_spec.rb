# As an air traffic controller
# So I can get passengers to a destination
# # I want to instruct a plane to land at an airport
require 'airport'


describe Airport do

let(:airport) { Airport.new }
let (:plane) { Plane.new }

describe '#land(plane)' do
  it 'allows planes to land at airport' do
    subject.land(plane)
    end
  end
end
