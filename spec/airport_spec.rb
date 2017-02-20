require 'airport'


describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  context 'Take-off and landing features' do
    it 'should confirm a plane has landed' do
      allow(subject).to receive(:stormy?).and_return false
      new_plane = plane
      subject.land(plane)
      expect(subject.landed_planes).to include plane
    end

    it 'should confirm a plane has taken off' do
      allow(subject).to receive(:stormy?).and_return false
      new_plane = plane
      subject.land(plane)
      subject.take_off
      expect(subject.airborne_planes).to include plane
    end
  end

  context 'Storm take-off and landing prevention' do
    it 'should raise error when trying to take-off when stormy' do
      allow(subject).to receive(:stormy?).and_return false
      new_plane = plane
      subject.land(new_plane)
      allow(subject).to receive(:stormy?).and_return true
      expect{subject.take_off}.to raise_error("Cannot take off under stormy weather conditions!")
    end

    it 'should raise error when trying to land a plane in stormy conditions' do
      allow(subject).to receive(:stormy?).and_return true
      new_plane = plane
      expect{subject.land(new_plane)}.to raise_error("Cannot land under stormy weather conditions!")
    end
  end

  context 'Capacity tests' do
    it 'should raise an error when trying to take off with no landed planes' do
      allow(subject).to receive(:stormy?).and_return false
      expect{subject.take_off}.to raise_error("Cannot take off as there are no planes available")
    end

    it 'should raise an error when trying to land a plane with the airport at full capacity' do
      allow(subject).to receive(:stormy?).and_return false
      new_plane = plane
      Airport::DEFAULT_CAPACITY.times{subject.land(new_plane)}
      expect{subject.land(new_plane)}.to raise_error("Cannot land plane, airport at full capacity")
    end

    it 'tests for set custom capacity' do
      airport = Airport.new(10)
      expect(airport.capacity).to eq 10
    end

  end

end
