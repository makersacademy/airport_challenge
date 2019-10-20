require 'plane'
require 'airport'

describe Plane do
  context 'when not stormy' do
    it 'can take off' do
      plane = Plane.new
      airport = Airport.new
      plane.land(airport)
      allow(airport).to receive(:stormy?).and_return false
      expect { plane.take_off(airport) }.not_to raise_error
    end

    it 'can land' do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return false
      expect { plane.land(airport) }.not_to raise_error
    end
  end

  context 'when stormy' do
    it 'raises an error when land is called' do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return true
      expect { plane.land(airport) }.to raise_error 'Too stormy for landing'
    end

    it 'raises an error when take_off is called' do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return true
      expect { plane.take_off(airport) }.to raise_error 'Too stormy for takeoff'
    end
  end
end
