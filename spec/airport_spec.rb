#Test Document to Test -
require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) { double :plane }

    describe 'initialization' do
      it 'defaults capacity' do
        described_class::DEFAULT_CAPACITY.times do
          allow(airport).to receive(:stormy?) { false }
          airport.land(plane)
        end
        allow(airport).to receive(:weather_state) { 'sunny' }
        expect { airport.land(plane) }.to raise_error 'Airport is full'
        end
    end

    it 'default capacity is 10 planes' do
      expect(airport.capacity).to eq 10
    end

    it 'lands a plane' do
      allow(airport).to receive(:weather_state) { 'sunny' }
      expect(airport.land(plane)).to eq [plane]
    end

    it 'takes off a plane' do
      allow(airport).to receive(:weather_state) { 'sunny' }
      airport.land(plane)
      expect(airport.take_off).to eq plane
    end

    it 'raises error when airport is empty tyring to take off plane' do
      allow(airport).to receive(:weather_state) { 'sunny' }
    expect { airport.take_off }.to raise_error 'No planes at airport'
    end

    it 'raises error when airport is full' do
      allow(airport).to receive(:weather_state) { 'sunny' }
      airport.capacity.times {airport.land plane}
      expect { airport.land(plane) }.to raise_error 'Airport is full'
    end

    it 'state of weather' do
      allow(airport).to receive(:weather_state) { 'stormy' }
      expect(airport.weather_state).to eq 'stormy'
    end

    it 'raises error when trying to land in stormy weather' do
      allow(airport).to receive(:weather_state) { 'stormy' }
      expect { airport.land(plane) }.to raise_error 'Weather is stormy'
    end
end
