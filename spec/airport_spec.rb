require 'airport'

describe Airport do
    
  describe 'Landing a plane' do

    it 'plane can land' do
      plane = Plane.new
      airport = Airport.new
      weather = Weather.new
      allow(weather).to receive(:stormy?).and_return(false)
      expect(airport.land(plane, weather)).to eq [plane]
    end
    
    it 'landed plane is in the airport' do
      plane = Plane.new
      airport = Airport.new
      weather = Weather.new
      allow(weather).to receive(:stormy?).and_return(false)
      airport.land(plane, weather)
      expect(airport.planes).to include plane
    end      
  end
    
    it 'plane takes off' do
      airport = Airport.new
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:stormy?).and_return(false)
      airport.land(plane, weather)
      allow(weather).to receive(:stormy?).and_return(false)
      expect(airport.take_off(plane, weather)).to be_a Plane
    end
     
    
    it 'checks plane has taken off' do
      airport = Airport.new
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:stormy?).and_return(false)
      airport.land(plane, weather)
      allow(weather).to receive(:stormy?).and_return(false)
      airport.take_off(plane, weather)
      expect(airport.taken_off?(plane)).to eq true
    end
     
         
    it 'raises error trying to takeoff in stormy weather' do
      airport = Airport.new
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:stormy?).and_return(false)
      airport.land(plane, weather) 
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.take_off(plane, weather) }.to raise_error 'Turbulent weather cannot takeoff'
    end
     
    it 'raises error when trying to land in stormy weather' do
      airport = Airport.new
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.land(plane, weather) }.to raise_error 'Turbulent weather cannot land'
    end
  
    it 'raises error when airport is full' do
      airport = Airport.new
      weather = Weather.new
      Airport::DEFAULT_CAPACITY.times do
        allow(weather).to receive(:stormy?).and_return(false)
        airport.land(Plane.new, weather)
      end
      allow(weather).to receive(:stormy?).and_return(false)
      expect { airport.land(Plane.new, weather) }.to raise_error 'Airport is full'
    end
       
end
