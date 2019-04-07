require 'airport'

RSpec.describe Airport do
  describe '#land' do
    it 'instructs a plane to land on an airport' do
      plane = Planes.new
      allow(subject).to receive(:rand) { 2 }
      expect(subject.stormy?).to eq false
      expect(subject.land(plane)).to eq plane
    end

    it 'does not allow plane to land if landed planes is 16' do
      allow(subject).to receive(:rand) { 2 }
      expect(subject.stormy?).to eq false
      expect { 17.times { subject.land(Planes.new) } }.to raise_error("Airport full!")
    end

    it 'does not allow plane to land if stormy weather' do
      plane = Planes.new
      allow(subject).to receive(:rand) { 1 }
      expect(subject.stormy?).to eq true
      expect { subject.land(plane) }.to raise_error("Stormy weather, do not land!")
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      plane = Planes.new
      allow(subject).to receive(:rand) { 2 }
      expect(subject.stormy?).to eq false
      expect(subject.take_off(plane)).to eq plane
    end

    it 'does not allow plane to take off if stormy weather' do
      plane = Planes.new
      allow(subject).to receive(:rand) { 1 }
      expect(subject.stormy?).to eq true
      expect { subject.take_off(plane) }.to raise_error("Stormy weather, do not take off!")
    end
  end

  describe '#stormy?' do
    it 'generates a 20% chance of stormy weather' do
      airport = Airport.new
      allow(airport).to receive(:rand) { 1 }
      expect(airport.stormy?).to eq true
    end
  end

  describe '#override_capacity' do
    it 'overrides the capacity of the airport' do
      expect(subject.override_capacity(20)).to eq 20
    end
  end
end
