require 'planes'

describe Plane do
  describe '#land_at' do
    it 'should not be able to land if airport at capacity' do
      airport = Airport.new
      airport.capacity.times { Plane.new.land_at(airport) }
      expect { Plane.new.land_at(airport) }.to raise_error 'Airport at capacity'
    end
    it 'should not be able to land if already landed' do
      plane = Plane.new
      plane.land_at(Airport.new)
      expect { plane.land_at(Airport.new) }.to raise_error 'This plane is already landed'
    end
  end

  describe '#take_off_from' do
    it 'should only take off from an airport it is in' do
      airport = Airport.new
      expect { subject.take_off_from(airport) }.to raise_error 'The plane is not at this airport'
    end
    it 'should not be able to take off in stormy weather' do
      airport = Airport.new
      subject.land_at(airport)
      allow(airport).to receive(:stormy?).and_return(true)
      expect { subject.take_off_from(airport) }.to raise_error 'Too stormy to take off'
    end
  end
end
