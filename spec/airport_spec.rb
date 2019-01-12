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
      weather = Weather.new
      airport.land(plane)
      expect(weather).to receive(:stormy?).and_return(false)
      expect(airport.take_off(plane, weather)).to be_a Plane
    end
   
  
    it 'plane has taken off' do
       airport = Airport.new
       plane = Plane.new
       weather = Weather.new
       airport.land(plane)
       expect(weather).to receive(:stormy?).and_return(false)
       airport.take_off(plane, weather)
       expect(airport.taken_off?(plane)).to eq true
   end
   
   it 'raise error when stormy' do
      airport = Airport.new
      plane = Plane.new
      weather = Weather.new
      airport.land(plane) 
      expect(weather).to receive(:stormy?).and_return(true)
      expect { airport.take_off(plane, weather) }.to raise_error 'Turbulent weather cannot takeoff'
  end
       
end
