require 'plane'

  describe Plane do

    it 'can land in an airport' do
      plane = Plane.new
      expect(plane.land(plane)).to eq plane
    end
    
  end
