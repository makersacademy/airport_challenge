require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { Airport.new }

  describe '#landing' do
    it 'lands a plane at the airport' do
      plane = Plane.new
      airport.land(plane)
      expect(plane.landed).to be true
    end
  end

  describe 'planes taking off' do
    it { is_expected.to respond_to(:takeoff).with(1).argument }
  end

end
