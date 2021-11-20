require 'airport'
require 'plane'

describe Airport do

  describe 'landing' do

    it 'lands a plane at an airport' do
      plane = Plane.new
      airport = Airport.new("Heathrow")

      expect(airport.land(plane)).to eq plane
    end

    it 'prevents landing a plane when the airport is full' do
      plane1 = Plane.new
      plane2 = Plane.new
      airport = Airport.new("Heathrow")
  
      airport.land(plane1)
  
      expect { airport.land(plane2) }.to raise_error("airport full: cannot land plane here") 
    end  
  end

  describe 'take off' do

    it 'confirms plane is no longer in the airport when plane takes off' do
      plane = Plane.new
      airport = Airport.new("Heathrow")

      airport.land(plane)

      expect(airport.take_off(plane)).to eq "sucessful take off of #{plane} from #{airport.name}"
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

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 
