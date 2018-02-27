require 'airport'
require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  let(:weather) { double(:stormy? => false) }

  describe 'status' do
    it 'plane status is flying if not in hangar' do
      expect(plane.status).to eq 'flying'
    end

    it 'change plane status if plane lands' do
      airport = Airport.new
      airport.land(plane, weather)
      expect(plane.status).to eq 'landed'
    end

    it 'change plane status if plane takes off' do
      airport = Airport.new

      airport.land(plane, weather)
      airport.take_off(plane, weather)
      expect(plane.status).to eq 'flying'
    end
  end
end
