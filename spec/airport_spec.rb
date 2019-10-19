# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
require 'airport'


describe Airport do

let(:airport) { Airport.new }
let (:plane) { Plane.new }

describe '#land(plane)' do
  it 'allows planes to land at airport' do
    subject.land(plane)
    end
  end
  describe '#take_off(plane)' do
    it 'allows planes to take off from airport' do
      subject.take_off(plane)
      expect(plane).to eq(plane)
      end
    end
end
