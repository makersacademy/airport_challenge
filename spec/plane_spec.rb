require 'airport'
require 'plane'

describe Plane do
  describe '#flight_id' do
    it 'can be assigned a flight ID upon initialization' do
      plane = Plane.new('ASC110')
      expect(plane.flight_id).to eq 'ASC110'
    end
  end
end
