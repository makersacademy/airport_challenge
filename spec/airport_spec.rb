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

  context 'capacity' do
    it 'has a default capacity of 5' do
      expect(airport.capacity).to eq 5
    end
    it 'can be set manually' do
      airport = Airport.new(10)
      expect(airport.capacity).to eq 10
    end
  end

  context 'changing weather' do
    it 'randomly sets the weather to stormy' do
      allow_any_instance_of(Weather).to receive(:stormy?) {true}
      expect(airport.check_new_weather).to eq "It is stormy."
    end
    it 'randomly sets the weather to sunny' do
      allow_any_instance_of(Weather).to receive(:stormy?) {false}
      expect(airport.check_new_weather).to eq "It is sunny."
    end
  end

  context 'good weather' do
    before do
      allow_any_instance_of(Weather).to receive(:stormy?) {false}
    end
    describe '#status' do
      it 'shows the status of a landed plane' do
        allow(plane).to receive(:landed).and_return(true)
        airport.land plane
        expect(airport.status plane).to eq "Landed"
      end
      it 'shows the status of a plane in the air' do
        allow(plane).to receive(:landed).and_return(false)
        airport.take_off plane
        expect(airport.status plane).to eq "In the air"
      end
    end

    describe '#land' do
      it 'lands a plane' do
        expect(plane).to receive(:land)
        airport.land plane
      end
      it 'puts a landed plane in the airport' do
        airport.land plane
        expect(airport.planes).to include plane
      end
      it 'prevents landing when the airport is full' do
        airport.capacity.times {airport.land plane}
        expect{airport.land plane}.to raise_error("The airport is full.")
      end
    end

    describe '#take_off' do
      it 'takes off a plane' do
        expect(plane).to receive(:take_off)
        airport.take_off plane
      end
      it 'removes taken off planes from the airport' do
        airport.planes << plane
        airport.take_off plane
        expect(airport.planes).not_to include(plane)
      end
    end
  end

  context 'stormy weather' do
    before do
      allow_any_instance_of(Weather).to receive(:stormy?) {true}
    end
    it 'should not allow planes to take off during a storm' do
      expect{airport.take_off plane}.to raise_error "The plane cannot take off during the storm."
    end
    it 'should not allow planes to land during a storm' do
      expect{airport.land plane}.to raise_error "The plane cannot land during the storm."
    end
  end

end
