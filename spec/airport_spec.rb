require 'airport'

describe Airport do
  let(:weather) { double :weather }
  let(:plane) { double :plane }
  let(:airport) { double :airport }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(2).arguments }

    it 'raises an error for landing when weather is stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { subject.land(plane, weather) }.to raise_error("Plane may *not* land")
    end

    it 'raises an error for landing when airport is full' do
      allow(weather).to receive(:stormy?).and_return(true)
      allow(airport).to receive(:full?).and_return(true)
      expect { subject.land(plane, weather) }.to raise_error("Plane may *not* land")
    end

    it 'allows landing when weather is sunny and airport has available slots' do
      allow(weather).to receive(:stormy?).and_return(false)
      allow(airport).to receive(:full?).and_return(false)
      allow(subject).to receive(:at_airport?).and_return(false)
      expect(subject.land(plane, weather)).to be_truthy
    end

    it 'returns true if plane has not yet landed' do
      allow(subject).to receive(:at_airport?).and_return(false)
      allow(weather).to receive(:stormy?).and_return(false)
      expect(subject.land(plane, weather)).to be_truthy
    end

    it 'returns false if plane is already at the airport' do
      allow(subject).to receive(:at_airport?).and_return(true)
      allow(weather).to receive(:stormy?).and_return(false)
      expect(subject.land(plane, weather)).to be_falsy
    end

    it 'uses default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_AIRPORT_CAPACITY
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(2).arguments }

    it 'raises an error for take_off when weather is stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      allow(subject).to receive(:at_airport?).and_return(true)
      expect { subject.take_off(plane, weather) }.to raise_error("Stormy weather - no take off allowed")
    end

    it 'allows take off when weather is sunny' do
      allow(subject).to receive(:at_airport?).and_return(true)
      allow(weather).to receive(:stormy?).and_return(false)
      expect(subject.take_off(plane, weather)).to eq true
    end

    it 'returns true if plane is already at the airport' do
      allow(subject).to receive(:at_airport?).and_return(true)
      allow(weather).to receive(:stormy?).and_return(false)
      expect(subject.take_off(plane, weather)).to eq true
    end

    it 'returns false if plane is not at the airport' do
      allow(subject).to receive(:at_airport?).and_return(false)
      allow(weather).to receive(:stormy?).and_return(false)
      expect(subject.take_off(plane, weather)).to be_falsy
    end

    describe '#at_airport?' do
      it { is_expected.to respond_to(:at_airport?) }

      it 'returns true if plane is at the airport' do
        allow(subject).to receive(:at_airport?).and_return(true)
        expect(subject.at_airport?(plane)).to eq true
      end

      it 'returns false if plane is not at the airport' do
        allow(subject).to receive(:at_airport?).and_return(false)
        expect(subject.at_airport?(plane)).to eq false
      end
    end
  end
end
