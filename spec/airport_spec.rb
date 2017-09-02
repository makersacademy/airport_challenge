require 'airport'

describe Airport do
  subject(:airport) {described_class.new}

  describe '#land'
    it 'allows an airport to accept a landing plane' do
      plane = Plane.new
      expect(airport.land(plane)).to eq plane
    end



end
