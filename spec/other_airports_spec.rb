require 'airport'
require 'plane'
require 'weather'

describe Airport do

context 'when plane in another aiport' do
    it 'Raises an error' do
      luton = Airport.new
      jet = Plane.new
      allow(luton).to receive(:storms?){false}
      luton.land(jet)
      gatwick = Airport.new
      expect(gatwick.take_off(jet)).to raise_error message
    end
  end

end
