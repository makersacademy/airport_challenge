require 'airport'
require 'weather'

describe Airport do
  subject(:plane) {described_class.new}
  subject(:weather) {described_class.new} #not sure how to format this for a module

  describe '#initialize' do
    it 'sets the default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'allows the default capacity to be overwritten' do
      subject = Airport.new(35)
      expect(subject.capacity).to eq 35
    end
  end

  describe '#land(plane)' do
    it 'allows a plane to land' do
      plane = double :plane
      subject.land(plane)
    end
    it 'holds planes after landing' do
      plane = double :plane
      allow(plane).to receive(:land)
      subject.land(plane)
      expect(subject.land(plane)).to include plane
    end
    it 'prevents landing when full' do
      Airport::DEFAULT_CAPACITY.times { subject.land double :plane}
      expect { subject.land double(:plane) }.to raise_error('Airport full: no landing')
    end
  end

  describe '#take_off' do
    it 'sends a message when plane is no longer in airport' do
      plane = double(:plane)
      allow(plane).to receive(:left?)
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.all_planes).not_to include plane
    end
  end

  describe 'stormy weather' do
    it 'does not allow take-off in storms' do
      plane = double(:plane)
      all_planes = double(:all_planes)
      allow(weather).to receive(:stormy?) {true}
      allow(plane).to receive(:left?)
      expect{subject.take_off(plane)}.to raise_error('Stormy weather: no take-off')
    end
    it 'does not allow landing in storms' do
      plane = double(:plane)
      allow(weather).to receive(:stormy?) {true}
      allow(plane).to receive(:landed?)
      expect{subject.land(plane)}.to raise_error('Stormy weather: no landing')
    end
  end

end
