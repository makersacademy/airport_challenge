require 'airport'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  describe '#land(plane)' do

    it 'does not allow landing in stormy weather' do
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.land(plane) }.to raise_error "It is too stormy to land"
    end

    it 'does not allow landing if airport full' do
      allow(subject).to receive(:stormy?).and_return false
      allow(subject).to receive(:already_landed?).and_return false
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "Airport full"
    end

    it 'does not allow a plane to land if it has already landed' do
      allow(subject).to receive(:stormy?).and_return false
      allow(subject).to receive(:already_landed?).and_return true
      expect { subject.land(plane) }.to raise_error "That plane has already landed"
    end
  end

  describe '#take_off(plane)' do
    it 'does not allow planes to take off in stormy weather' do
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.take_off(plane) }.to raise_error "It is too stormy to take off"
    end
    it 'does not allow a plane to take off if not in airport' do
      allow(subject).to receive(:stormy?).and_return false
      allow(subject).to receive(:already_landed?).and_return false
      expect { subject.take_off(plane) }.to raise_error "This plane is not here"
    end
  end
end
