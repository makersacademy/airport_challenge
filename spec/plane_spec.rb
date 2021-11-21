require 'plane'

describe Plane do
  describe '#land' do
    it 'should land plane in specified airport' do
      airport = Airport.new
      plane = Plane.new

      plane.land(airport)

      expect(plane.location).to eq(airport)

    end
  end

  describe '#take_off' do
    it 'should set plane location to :airbourne' do
      airport = Airport.new
      plane = Plane.new(airport)

      plane.take_off
      
      expect(plane.location).to eq(:airbourne)
    end
  end
end
