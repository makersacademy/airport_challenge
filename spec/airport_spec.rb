require 'airport'

describe Airport do
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:planes) }
  it { is_expected.to respond_to(:contains?).with(1).argument }
  it { is_expected.to respond_to(:capacity) }
  it { is_expected.to respond_to(:weather=) }

  describe '#land' do
    it 'instructs a plane to land at airport' do
      subject.land(plane)
      expect(subject.planes).to eq([plane])
    end
    it 'it parks a landed plane at airport' do
      subject.land(plane)
      expect(subject.planes.include?(plane)).to be(true)
    end
    it 'raises error when a plane tries to land at a full airport with default capacity' do
      Airport::DEFAULT_CAPACITY.times { subject.land(double(:plane)) }
      expect { subject.land(plane) }.to raise_error("Airport full")
    end
    it 'raises error when a plane tries to land at a full airport with manual capacity' do
      capacity = (1..100).to_a.sample
      airport = described_class.new(capacity)
      capacity.times { airport.land(double(:plane)) }
      expect { airport.land(plane) }.to raise_error("Airport full")
    end

    describe 'Edge case: Instrucing plane to land that has already landed' do
      it 'raises error when a plane tries to land that has already landed' do
        specific_plane = double(:plane)
        subject.land(specific_plane)
        expect { subject.land(specific_plane) }.to raise_error('Plane has already landed')
      end
    end

    describe 'landing during stormy weather' do
      before do
        allow(weather).to receive(:stormy?).and_return(true)
      end
      it 'raises error when plane tries to land during stormy weather' do
        subject.weather = weather
        expect { subject.land(plane) }.to raise_error('Cannot land because of stormy weather')
      end
    end
  end

  describe '#take_off' do
    it 'it instructs a plane to take off from the airport' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq(plane)
    end
    it 'removes a plane that has left from the airport' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes.include?(plane)).to be(false)
    end

    describe 'take off during stormy weather' do
      before do
        allow(weather).to receive(:stormy?).and_return(true)
      end
      it 'raises error when plane tries to take off during stormy weather' do
        subject.weather = weather
        expect { subject.take_off(plane) }.to raise_error('Cannot take off because of stormy weather')
      end
    end
    describe 'Edge case: instrucint a plane to take off that is no longer at the airport' do
      it 'raises error when a plane is instruced to take off that is not in the airport' do
        specific_plane = double(:plane)
        subject.land(specific_plane)
        subject.take_off(specific_plane)
        expect { subject.take_off(specific_plane) }.to raise_error('Plane is not at this airport')
      end
    end
  end

  describe 'set airport capacity' do
    it 'a new airport has a default capacity' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
    it 'the capacity of a new airport can be manually set' do
      capacity = (1..100).to_a.sample
      airport = described_class.new(capacity)
      expect(airport.capacity).to eq(capacity)
    end
  end

  describe '#contains?' do
    it 'returns true when plane is in the airport' do
      subject.land(plane)
      expect(subject.contains?(plane)).to be(true)
    end
    it 'returns false when airport is empty' do
      expect(subject.contains?(plane)).to be(false)
    end
    it 'returns false when specific plane is not in airport' do
      subject.land(plane)
      another_plane = double(:plane)
      expect(subject.contains?(another_plane)).to be(false)
    end
  end
end
