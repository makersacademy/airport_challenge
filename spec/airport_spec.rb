require 'airport'

describe Airport do
    
    it 'land something' do
      expect(Airport.new).to respond_to(:land).with(1).argument
    end

    it 'land a plane' do
      plane = Plane.new
      airport = Airport.new
      expect(airport.land(plane)).to eq plane
    end

end
