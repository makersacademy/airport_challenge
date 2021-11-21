require 'airport'
require 'plane'

describe Airport do
  describe '#hanger_full?' do
    context 'hanger is full' do
      it 'returns true' do
        airport = Airport.new(0)
        expect(airport.hanger_full?).to be true
      end
    end

    context 'hanger is not full' do
      it 'returns false' do
        expect(subject.hanger_full?).to be false
      end
    end
  end

  describe '#land' do
    context 'plane is airbourne and hanger is not full' do
      it 'lands the plane in the airport' do
        airport = Airport.new
        plane = Plane.new

        airport.land(plane)
        expect(airport.in_hanger?(plane)).to be true
      end
    end
  end

  describe '#take_off' do
    context 'plane is in airport' do
      airport = Airport.new
      plane = Plane.new

      airport.land(plane)
      airport.take_off(plane)
      expect(airport.in_hanger?(plane)).to be false

    end
  end
end
