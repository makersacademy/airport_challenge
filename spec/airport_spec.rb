require 'airport'

describe Airport do
  
  describe '#initialize' do
    it 'takes an argument for setting capacity number' do
      expect(initialize(10)).to eq @capacity
    end
  end

  describe '#land' do
    context 'when airport is full' do
      before do
        allow(subject).to receive(:stormy?) { false }
      end
      it 'raises an error' do
        Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
        expect { subject.land(Plane.new) }.to raise_error("Unable to land plane as the airport is full.")
      end
    end
    context 'when landed plane tries to land' do
      before do
        allow(subject).to receive(:stormy?) { false }
      end
      it 'raises an error' do
        plane = Plane.new
        subject.land(plane)
        expect { subject.land(plane) }.to raise_error("That plane has already landed.")
      end
    end
    context 'when not stormy' do
      before do
        allow(subject).to receive(:stormy?) { false }
      end
      it 'lands a plane' do
        expect(subject).to respond_to(:land).with(1).argument
      end
      it 'stores a plane at the airport' do
        plane = Plane.new
        subject.land(plane)
        expect(subject.planes).to eq [plane]
      end
    end
    context 'when stormy' do
      before do
        allow(subject).to receive(:stormy?) { true }
      end
      it 'raises an error' do
        plane = Plane.new
        expect { subject.land(plane) }.to raise_error("Unable to land plane due to stormy weather.")
      end
    end
  end

  describe '#take_off' do
    context 'when airport is empty' do
      before do
        allow(subject).to receive(:stormy?) { false }
      end
      it 'raises an error' do
        plane = Plane.new
        allow(subject).to receive(:rand) { 2 }
        expect(subject.stormy?).to eq false
        expect { subject.take_off(plane) }.to raise_error("Unable to take off as the airport is empty.")
      end
    end
    context 'when plane is not in airport' do
      before do
        allow(subject).to receive(:stormy?) { false }
      end
      it 'raises an error' do
        plane = Plane.new
        subject.land(Plane.new)
        expect { subject.take_off(plane) }.to raise_error("That plane is not in the airport.")
      end
    end
    context 'when not stormy' do
      before do
        allow(subject).to receive(:stormy?) { false }
      end
      it 'confirms plane is no longer in airport' do
        plane = Plane.new
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes.empty?).to eq true
      end
    end
    context 'when stormy' do
      it 'raises an error' do
        plane = Plane.new
        allow(subject).to receive(:stormy?) { false }
        subject.land(plane)
        allow(subject).to receive(:stormy?) { true }
        expect { subject.take_off(plane) }.to raise_error("Unable to take off due to stormy weather.")
      end
    end
  end

  describe '#stormy?' do
    context 'when not stormy' do
      it 'returns false' do
        allow(subject).to receive(:rand) { 2 }
        expect(subject.stormy?).to eq false
      end
    end
    context 'when stormy' do
      it 'returns true if forecast is stormy' do
        allow(subject).to receive(:rand) { 9 }
        expect(subject.stormy?).to eq true
      end
    end
  end
end
