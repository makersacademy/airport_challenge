require 'transit'
require 'airport'

describe Transit do
  context 'should get a plane in transit if a plane has taken off' do
    it 'should return a plane' do

      plane = Plane.new
      airport = Airport.new
      clear_transit = double(:trasnit, stormy?: false, planes_in_transit: [])
      airport.land(plane, clear_transit)
      airport.take_off(plane, clear_transit)
      expect(clear_transit.planes_in_transit).to eq [plane]

    end
  end
  context 'weather' do
    it 'should return not stormy' do
      clear_transit = double(:transit, stormy?: false)
      expect(clear_transit.stormy?).to eq false
    end
    it 'should return stormy' do
      stormy_transit = double(:transit, stormy?: true)
      expect(stormy_transit.stormy?).to eq true
    end
  end
end
