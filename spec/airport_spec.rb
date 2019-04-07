require 'airport'

describe Airport do

  it 'takes an argument for setting capacity number' do
    expect(initialize(10)).to eq @capacity
  end

  describe '#land' do
    context 'when not stormy' do

      it 'raises an error if the airport is full' do
        allow(subject).to receive(:rand) { 2 }
        expect(subject.stormy?).to eq false
        Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
        expect { subject.land(Plane.new) }.to raise_error("Unable to land plane as the airport is full.")
      end

      it 'raises an error if a landed plane tries to land' do
        plane = Plane.new
        allow(subject).to receive(:rand) { 2 }
        expect(subject.stormy?).to eq false
        subject.land(plane)
        expect { subject.land(plane) }.to raise_error("That plane has already landed.")
      end

      it 'lands a plane' do
        expect(subject).to respond_to(:land).with(1).argument
      end

      it 'stores a plane at the airport' do
        plane = Plane.new
        allow(subject).to receive(:rand) { 2 }
        expect(subject.stormy?).to eq false
        subject.land(plane)
        expect(subject.planes).to eq [plane]
      end
    end

    context 'when stormy' do

      it 'raises an error if the weather is stormy' do
        plane = Plane.new
        allow(subject).to receive(:rand) { 9 }
        expect(subject.stormy?).to eq true
        expect { subject.land(plane) }.to raise_error("Unable to land plane due to stormy weather.")
      end
    end
  end

  describe '#take_off' do
    context 'when not stormy' do

      it 'raises an error if the airport is empty' do
        plane = Plane.new
        allow(subject).to receive(:rand) { 2 }
        expect(subject.stormy?).to eq false
        expect { subject.take_off(plane) }.to raise_error("Unable to take off as the airport is empty.")
      end

      it 'raises an error if the plane is not in the airport' do
        plane = Plane.new
        allow(subject).to receive(:rand) { 2 }
        expect(subject.stormy?).to eq false
        subject.land(Plane.new)
        expect { subject.take_off(plane) }.to raise_error("That plane is not in the airport.")
      end

      it 'confirms plane is no longer in airport' do
        plane = Plane.new
        allow(subject).to receive(:rand) { 2 }
        expect(subject.stormy?).to eq false
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes.empty?).to eq true
      end
    end

    context 'when stormy' do

      it 'raises an error if the weather is stormy' do
        plane = Plane.new
        allow(subject).to receive(:rand) { 2 }
        expect(subject.stormy?).to eq false
        subject.land(plane)
        allow(subject).to receive(:rand) { 9 }
        expect(subject.stormy?).to eq true
        expect { subject.take_off(plane) }.to raise_error("Unable to take off due to stormy weather.")
      end
    end

    describe '#stormy?' do
      it 'returns false if forecast is not stormy' do
        allow(subject).to receive(:rand) { 2 }
        expect(subject.stormy?).to eq false
      end

      it 'returns true if forecast is stormy' do
        allow(subject).to receive(:rand) { 9 }
        expect(subject.stormy?).to eq true
      end
    end
  end
end
