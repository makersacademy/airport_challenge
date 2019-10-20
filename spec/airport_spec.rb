# frozen_string_literal: true

require 'airport'

describe Airport do
  subject(:airport) { described_class.new(weather, 20) }
  let(:plane) { double :plane, landed: nil, taken_off: nil }
  let(:weather) { double :weather }

  context 'when weather is good' do
    before do
      allow(weather).to receive(:stormy?).and_return(false)
    end

    describe '#land' do
      it 'instructs plane to land' do
        expect(airport).to respond_to(:land)
        airport.land(plane)
      end

      it 'confirms non-flying planes are in airport' do
        airport.land plane
        expect(airport.planes).to include plane
      end

      it 'instructs landing only on flying planes' do
        allow(plane).to receive(:flying?).and_return(true)
        expect { airport.land(plane) }.not_to raise_error
      end

      it 'raises error when trying to land grounded plane' do
        airport.land(plane)
        expect { airport.land(plane) }.to raise_error 'Cannot land: Plane already at airport'
      end
    end

    describe '#take_off' do
      it 'instructs plane to take off' do
        expect(airport).to respond_to(:take_off).with(1).argument
      end

      it 'confirms flying planes are not in airport' do
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.planes).not_to include plane
      end

      it 'instructs take off only on landed planes' do
        airport.land(plane)
        expect(airport.take_off(plane)).to eq plane
      end

      it 'raises an error if plane not at airport' do
        other_airport = described_class.new(weather)
        other_airport.land(plane)
        expect { airport.take_off(plane) }.to raise_error 'Cannot take off: Plane not at airport'
      end
    end
  end

  context 'when airport is full' do
    subject(:default_airport) { described_class.new(weather) }
    it 'gives an error when trying to land' do
      allow(weather).to receive(:stormy?).and_return(false)
      described_class::DEFAULT_CAPACITY.times { default_airport.land(Plane.new) }
      expect { default_airport.land(plane) }.to raise_error 'Cannot land: Airport is full'
    end
  end

  context 'when weather is stormy' do
    before do
      allow(weather).to receive(:stormy?).and_return(true)
    end

    it 'gives an error if trying to take off' do
      expect { airport.take_off(plane) }.to raise_error 'Cannot take off: Weather is stormy'
    end

    it 'gives an error if trying to land' do
      expect { airport.land(plane) }.to raise_error 'Cannot land: Weather is stormy'
    end
  end

  it 'allows user to override capacity' do
    airport = Airport.new(weather, 25)
    expect(airport.capacity).to eq 25
  end
end
