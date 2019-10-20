require 'plane'
require 'airport'

describe Plane do
  context 'when not stormy' do
    it 'can land' do
      plane = Plane.new
      airport = double('Airport', :stormy? => false)
      expect { plane.land(airport) }.not_to raise_error
    end

    it 'can take off' do
      plane = Plane.new
      airport = double('Airport', :stormy? => false, :plane_leaves => true)
      expect { plane.take_off(airport) }.not_to raise_error
    end
  end

  context 'when stormy' do
    it 'raises an error when land is called' do
      plane = Plane.new
      airport = double('Airport', :stormy? => true)
      expect { plane.land(airport) }.to raise_error 'Too stormy to land'
    end

    it 'raises an error when take_off is called' do
      plane = Plane.new
      airport = double('Airport', :stormy? => true)
      expect { plane.take_off(airport) }.to raise_error 'Too stormy to take off'
    end
  end
end
