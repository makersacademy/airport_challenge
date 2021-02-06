require 'plane'

describe Plane do
let(:heathrow_airport) { Airport.new }

  describe '#land' do
    it 'should take one argument' do
      expect(subject).to respond_to(:land).with(1)
    end
    it 'should add the plane the airport specified' do
      plane_1 = Plane.new
      plane_1.land(heathrow_airport)
      expect(heathrow_airport.hangar).to include(plane_1)
    end
  end

end
