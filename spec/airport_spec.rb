require 'airport'

describe Airport do
  describe '#land' do
    it 'lands at an airport' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq([plane])
    end

    it 'stores planes in an airport' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.planes).to eq([plane])
    end
  end

  describe '#take_off' do
    it 'takes off' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)

      expect(airport.take_off(plane)).to eq(plane)
    end

    it 'removes itself from an airport after takin off' do
      airport = Airport.new
      plane = Plane.new
      plane2 = Plane.new

      airport.land(plane)
      airport.land(plane2)
      airport.take_off(plane)

      expect(airport.planes).not_to include([plane])
    end
  end

  describe '#full?' do
    it 'checks to see if an airport is full' do
      airport = Airport.new
      airport.capacity.times{airport.land(Plane.new)}
      expect(airport.full?).to eq true
    end

    it 'raises an error when landing at full airport' do
      airport = Airport.new(2)
      airport.land(Plane.new)
      airport.land(Plane.new)

      expect{airport.land(Plane.new)}.to raise_error('Cannot land. The airport is full.')
    end
  end
end