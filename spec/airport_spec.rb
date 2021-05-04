require 'airport'

describe Airport do
  let(:plane) { double :plane }

  describe '#land' do

    context 'whilst raining' do

      before { allow(subject).to receive(:weather) { 'rain' } }

      it 'lands at an airport' do
        subject.land(plane)
        expect(subject.planes.include?(plane)).to eq true
      end

      it 'stores a plane in an airport' do
        subject.land(plane)
        expect(subject.planes).to include(plane)
      end

      it 'cannot land an already landed plane' do
        subject.land(plane)
        expect{subject.land(plane)}.to raise_error('This plane has already landed')
      end

      it 'raises an error when landing at full airport with default capacity' do
        Airport::DEFAULT_CAPACITY.times{subject.land(Plane.new)}
        expect{subject.land(Plane.new)}.to raise_error('Cannot land. The airport is full.')
      end
    end

    it 'raises an error when landing at full airport with explicit capacity' do
      airport = Airport.new(500)
      allow(airport).to receive(:weather) { 'rain' }
      airport.capacity.times{airport.land(Plane.new)}
      expect{airport.land(Plane.new)}.to raise_error('Cannot land. The airport is full.')
    end

    context 'whilst stormy' do  

      it 'cannot land in stormy weather' do
        allow(subject).to receive(:weather) { 'stormy' }
        expect{subject.land(plane)}.to raise_error('DANGER. STORMY WEATHER.')
      end
    end
  end

  describe '#take_off' do
  
    context 'whilst raining and a plane is docked' do

      before { allow(subject).to receive_messages(weather: 'rain', planes: [plane]) }

      it 'takes off' do
        expect(subject.take_off(plane)).to eq(plane)
      end

      it 'removes itself from an airport after taking off' do
        subject.take_off(plane)
        expect(subject.planes).not_to include([plane])
      end

      it 'cannot take off if the plane is not at the airport' do
        subject.take_off(plane)
        expect{subject.take_off(plane)}.to raise_error('This plane has already taken off')
      end
    end

    context 'whilst stormy and a plane is docked' do

      it 'cannot take off in stormy weather' do  
        allow(subject).to receive_messages(planes: [plane], weather: 'stormy')
        expect{subject.take_off(plane)}.to raise_error('DANGER. STORMY WEATHER.')
      end
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