require 'airport'

describe Airport do
    
    it 'land something' do
      expect(Airport.new).to respond_to(:land).with(1).argument
    end

    it 'land a plane' do
      plane = Plane.new
      airport = Airport.new
      expect(airport.land(plane)).to eq [plane]
    end

    it 'responds to take_off' do
      expect(Airport.new).to respond_to(:take_off)
    end
  
    it 'plane takes off' do
      airport = Airport.new
      airport.land(Plane.new)
      expect(airport.take_off).to be_a Plane
    end

end
