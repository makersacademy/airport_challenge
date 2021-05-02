require 'airport'

describe Airport do
  describe '#land' do
    it 'lands at an airport' do
      plane = Plane.new
      allow(subject).to receive(:weather) { 'rain' }
      expect(subject.land(plane)).to eq([plane])
    end

    it 'stores a plane in an airport' do
      plane = Plane.new
      allow(subject).to receive(:weather) { 'rain' }
      subject.land(plane)
      expect(subject.planes).to eq([plane])
    end

    it 'cannot land an already landed plane' do
      plane = Plane.new
      allow(subject).to receive(:weather) { 'rain' }
      subject.land(plane)
      expect{subject.land(plane)}.to raise_error('This plane has already landed')
    end

    it 'raises an error when landing at full airport with default capacity' do
      allow(subject).to receive(:weather) { 'rain' }
      Airport::DEFAULT_CAPACITY.times{subject.land(Plane.new)}
      expect{subject.land(Plane.new)}.to raise_error('Cannot land. The airport is full.')
    end

    it 'raises an error when landing at full airport with explicit capacity' do
      airport = Airport.new(500)
      allow(airport).to receive(:weather) { 'rain' }
      airport.capacity.times{airport.land(Plane.new)}
      expect{airport.land(Plane.new)}.to raise_error('Cannot land. The airport is full.')
    end
  end

  describe '#take_off' do
    it 'takes off' do
      plane = Plane.new
      allow(subject).to receive(:weather) { 'rain' }
      subject.land(plane)
      expect(subject.take_off(plane)).to eq(plane)
    end

    it 'removes itself from an airport after taking off' do
      plane = Plane.new
      plane2 = Plane.new

      allow(subject).to receive(:weather) { 'rain' }
      subject.land(plane)
      subject.land(plane2)
      subject.take_off(plane)

      expect(subject.planes).not_to include([plane])
    end

    it 'cannot take off in stormy weather' do
      plane = Plane.new

      allow(subject).to receive(:weather) { 'stormy' }
      expect{subject.take_off(plane)}.to raise_error('DANGER. STORMY WEATHER.')
    end

    it 'cannot land in stormy weather' do
      plane = Plane.new

      allow(subject).to receive(:weather) { 'stormy' }
      expect{subject.land(plane)}.to raise_error('DANGER. STORMY WEATHER.')
    end
  end

  describe '#full?' do
    it 'checks to see if an airport is full' do
      allow(subject).to receive(:weather) { 'rain' }
      subject.capacity.times{subject.land(Plane.new)}
      expect(subject.full?).to eq true
    end
  end

  describe '#weather?' do
    it 'creates a random weather object' do
      expect(Weather::CONDITION.map { |k, v| v }).to include(subject.weather)
    end
  end
end