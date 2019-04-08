require 'airport'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  describe '#land' do
    it 'does not allow landing in stormy weather' do
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.land(plane)}.to raise_error "It is too stormy to land"
    end

    it 'does not allow landing if airport full' do
      allow(subject).to receive(:stormy?).and_return false
      Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
      expect {subject.land(plane)}.to raise_error "Airport full"
  end
end

  describe '#take off' do
    it 'does not allow planes to take off in stormy weather' do
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.take_off }.to raise_error "It is too stormy to take off"
    end
  end
end
