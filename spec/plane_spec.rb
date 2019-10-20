require 'plane'
require 'airport'

describe Plane do
  it 'can take off' do
    plane = Plane.new
    airport = Airport.new
    expect { plane.take_off(airport) }.not_to raise_error
  end

  context 'when not stormy' do
    it 'can land' do
      plane = Plane.new
      airport = double('Airport', :stormy? => false)
      expect { plane.land(airport) }.not_to raise_error
    end
  end

  context 'when stormy' do
    it 'raises an error when land is called' do
      plane = Plane.new
      airport = double('Airport', :stormy? => true)
      expect { plane.land(airport) }.to raise_error "Too stormy to land"
    end
  end
end
