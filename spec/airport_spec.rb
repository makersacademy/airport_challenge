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
      plane = Plane.new
      airport.land(plane)
      expect(airport.take_off(plane)).to be_a Plane
    end
   
  
    it 'plane has taken off' do
       airport = Airport.new
       plane = Plane.new
       airport.land(plane)
       airport.take_off(plane)
       expect(airport.taken_off?(plane)).to eq true
   end
       
end
