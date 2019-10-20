require 'airport'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  describe '#land(plane)' do

    it 'allows a plane to land' do
      allow(subject).to receive(:stormy?).and_return false
      allow(subject).to receive(:has_landed?).and_return false
      allow(subject).to receive(:in_airport?).and_return false
      subject.land(plane)
      allow(subject).to receive(:has_landed?).and_return true
      expect(subject.planes).to include plane
    end

    it 'does not allow landing in stormy weather' do
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.land(plane) }.to raise_error "Too stormy to land"
    end

    it 'does not allow landing if airport full' do
      allow(subject).to receive(:stormy?).and_return false
      allow(subject).to receive(:has_landed?).and_return false
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "Airport is full"
    end

    it 'does not allow a plane to land if it has already landed' do
      allow(subject).to receive(:stormy?).and_return false
      allow(subject).to receive(:has_landed?).and_return true
      expect { subject.land(plane) }.to raise_error "That plane has already landed"
    end
  end

  describe '#take_off(plane)' do

    it 'allows a plane to take off' do
      allow(subject).to receive(:stormy?).and_return false
      allow(subject).to receive(:has_landed?).and_return false
      allow(subject).to receive(:in_airport?).and_return true
      subject.take_off(plane)
      expect(plane).to eq(plane)
    end

    it 'does not allow planes to take off in stormy weather' do
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.take_off(plane) }.to raise_error "Too stormy for take off"
    end
    it 'does not allow a plane to take off if not in airport' do
      allow(subject).to receive(:stormy?).and_return false
      allow(subject).to receive(:has_landed?).and_return false
      expect { subject.take_off(plane) }.to raise_error "No plane in airport, cannot take off"
    end
  end
end
