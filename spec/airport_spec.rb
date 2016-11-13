require 'airport'
require 'plane'
require 'weather'

describe Airport do

  subject(:airport) {described_class.new}
  let(:plane) {double :plane}
  let(:weather) {double :weather}

  before do
    allow(plane).to receive(:land)
    allow(plane).to receive(:take_off)
  end

  describe '#status' do
    before do
      allow(weather).to receive(:stormy?).and_return false
    end
    it 'shows the status of a landed plane' do
      allow(plane).to receive(:landed).and_return(true)
      subject.stormy = false
      airport.land plane
      expect(airport.status plane).to eq "Landed"
    end

    it 'shows the status of a plane in the air' do
      allow(plane).to receive(:landed).and_return(false)
      subject.stormy = false
      airport.take_off plane
      expect(airport.status plane).to eq "In the air"
    end
  end

  describe '#land' do
    before do
      allow(weather).to receive(:stormy?).and_return false
    end
    it 'lands a plane' do
      airport.stormy = false
      expect(plane).to receive(:land)
      airport.land plane
    end
    it 'puts a landed plane in the airport' do
      airport.stormy = false
      airport.land plane
      expect(airport.planes).to include plane
    end
    it 'should not land during a storm' do
      airport.stormy = true
      expect{airport.land plane}.to raise_error "Plane cannot land during a storm."
    end
    it 'prevents landing when the airport is full' do
      airport.stormy = false
      airport.capacity.times {airport.land plane}
      expect{airport.land plane}.to raise_error("The airport is full.")
    end
  end

  describe '#take_off' do

    it 'takes off a plane' do
      subject.stormy = false
      expect(plane).to receive(:take_off)
      airport.take_off plane
    end
    it 'removes taken off planes from the airport' do
      airport.stormy = false
      airport.planes << plane
      airport.take_off plane
      expect(airport.planes).not_to include(plane)
    end
    it 'should not take off during a storm' do
      subject.stormy = true
      expect{airport.take_off plane}.to raise_error "Plane cannot take off during a storm."
    end
  end

end
