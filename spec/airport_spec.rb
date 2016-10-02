require 'spec_helper'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    context 'when not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return false
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
      it 'raises an error if asked to land a plane' do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error 'Cannot land plane: weather is stormy'
      end
    end
  end

  describe '#take_off' do
    it 'should instruct a plane to take_off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it 'should confirm that the plane in no longer at the Airport' do
      allow(airport).to receive(:stormy?).and_return false
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end
  end
end
