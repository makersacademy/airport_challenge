require 'airport'

describe Airport do
  describe '#land' do
    it 'lands at an airport' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq([plane])
    end

    it 'stores a plane in an airport' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.planes).to eq([plane])
    end

    it 'raises an error when landing at full airport with default capacity' do
      airport = Airport.new
      Airport::DEFAULT_CAPACITY.times{airport.land(Plane.new)}

      expect{airport.land(Plane.new)}.to raise_error('Cannot land. The airport is full.')
    end

    it 'raises an error when landing at full airport with explicit capacity' do
      airport = Airport.new(500)
      airport.capacity.times{airport.land(Plane.new)}

      expect{airport.land(Plane.new)}.to raise_error('Cannot land. The airport is full.')
    end
  end

  describe '#take_off' do
    it 'takes off' do
      plane = Plane.new
      subject.land(plane)

      allow(subject).to receive(:weather) { 'rain' }
      expect(subject.take_off(plane)).to eq(plane)
    end

    it 'removes itself from an airport after taking off' do
      plane = Plane.new
      plane2 = Plane.new

      subject.land(plane)
      subject.land(plane2)
      allow(subject).to receive(:weather) { 'rain' }
      subject.take_off(plane)

      expect(subject.planes).not_to include([plane])
    end

    it 'cannot take off in stormy weather' do
      plane = Plane.new

      allow(subject).to receive(:weather) { 'stormy' }
      expect{subject.take_off(plane)}.to raise_error('DANGER. STORMY WEATHER.')
    end
  end

  describe '#full?' do
    it 'checks to see if an airport is full' do
      airport = Airport.new
      airport.capacity.times{airport.land(Plane.new)}
      expect(airport.full?).to eq true
    end
  end

  describe '#weather?' do
    it 'creates a random weather object' do
      weather = Weather.new
      expect(weather.CONDITION).to include subject.weather
    end
  end
end