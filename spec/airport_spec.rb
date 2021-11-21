require 'airport'
require 'plane'

describe Airport do

  describe 'landing' do

    it 'lands a plane at an airport' do
      plane = Plane.new
      airport = Airport.new("Heathrow")
      allow(airport).to receive(:weather) { "sunny" }

      expect(airport.land(plane)).to eq "sucessful landing of #{plane} at #{airport.name}"
    end

    it 'prevents landing a plane when the airport is full' do
      plane1 = Plane.new
      plane2 = Plane.new
      airport = Airport.new("Heathrow")
      allow(airport).to receive(:weather) { "sunny" }

      airport.land(plane1)
  
      expect { airport.land(plane2) }.to raise_error("airport full: cannot land plane here") 
    end  

    it 'prevents landing when weather is stormy' do
      plane = Plane.new
      airport = Airport.new("Heathrow")
      allow(airport).to receive(:weather) { "stormy" }

      expect { airport.land(plane) }.to raise_error("plane cannot land, weather is stormy")
    end
    
    it 'ensures planes that are landed cannot land again without taking off first' do
      plane = Plane.new
      airport = Airport.new("Heathrow", 2)
      allow(airport).to receive(:weather) { "sunny" }

      airport.land(plane)

      expect { airport.land(plane) }.to raise_error("#{plane} has already landed in #{airport.name}")
    end
  end

  describe 'take off' do

    it 'plane can take off from an airport' do
      plane = Plane.new
      airport = Airport.new("Heathrow")
      allow(airport).to receive(:weather) { "sunny" }

      airport.land(plane)

      expect(airport).to respond_to(:take_off)
    end

    it 'confirms plane is no longer in the airport when plane takes off' do
      plane = Plane.new
      airport = Airport.new("Heathrow")
      allow(airport).to receive(:weather) { "sunny" }

      airport.land(plane)

      expect(airport.take_off(plane)).to eq "sucessful take off of #{plane} from #{airport.name}"     
    end

    it 'prevents take off when weather is stormy' do
      plane = Plane.new
      airport = Airport.new("Heathrow")
      allow(airport).to receive(:weather) { "sunny" }

      airport.land(plane)

      allow(airport).to receive(:weather) { "stormy" }

      expect { airport.take_off(plane) }.to raise_error("plane cannot take off, weather is stormy")
    end

    it 'planes can only take off from airports they are in' do
      plane = Plane.new
      airport = Airport.new("Heathrow")
      allow(airport).to receive(:weather) { "sunny" }

      expect { airport.take_off(plane) }.to raise_error("#{plane} not currently in #{airport.name}")
    end
  end

  describe 'airport capacity' do

    it 'has a default airport capacity' do
      airport = Airport.new("Heathrow")
      
      expect(airport.capacity).to eq 1
    end

    it 'has a default airport capacity that can be overridden' do
      airport = Airport.new("Heathrow", 50)
      
      expect(airport.capacity).to eq 50
    end
  end
end
