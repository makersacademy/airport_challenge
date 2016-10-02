require 'spec_helper'

describe Airport do
  subject(:airport) { described_class.new(weather_forecast) }
  let(:plane) { double :plane }
  let(:weather_forecast) { double :weather_forecast }

  describe '#land' do
    context 'when not stormy' do
      before do
        allow(weather_forecast).to receive(:stormy?).and_return false
      end

      it 'should instruct a plane to land' do
        expect(airport).to respond_to(:land).with(1).argument
      end

      it 'should confirm a plane has landed' do
        airport.land(plane)
        expect(airport.planes).to include plane
      end
    end

    context 'when stormy' do
      before do
        allow(weather_forecast).to receive(:stormy?).and_return true
      end

      it 'raises an error if asked to land a plane' do
        expect { airport.land(plane) }.to raise_error 'Cannot land plane: weather is stormy'
      end
    end
  end

  describe '#take_off' do
    context 'when not stormy' do
      before do
        allow(weather_forecast).to receive(:stormy?).and_return false
      end

      it 'should instruct a plane to take off' do
        expect(airport).to respond_to(:take_off).with(1).argument
      end

      it 'should confirm that the plane in no longer at the Airport' do
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.planes).not_to include plane
      end
    end

    context 'when stormy' do
      before do
        allow(weather_forecast).to receive(:stormy?).and_return true
      end

      it 'raises an error if asked to take off a plane' do
        expect { airport.take_off(plane) }.to raise_error 'Cannot take off plane: weather is stormy'
      end
    end
  end
end
