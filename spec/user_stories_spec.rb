# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport
describe 'Controller can instruct a plane to land at an airport' do
  plane = Plane.new
  airport = Airport.new
  plane.land(airport)
  describe 'plane' do
    it 'can be instructed to land at an airport' do
      expect(plane).to respond_to(:land).with(1).argument
    end
  end
end

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
describe 'Controller can instruct plane to take off' do
  describe 'airport' do
    it 'can be confirmed as empty' do
      plane = Plane.new
      airport = Airport.new
      plane.land(airport)
      plane.takeoff
      expect(airport).to be_empty
    end
  end
end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full
describe 'Controller can prevent landing when airport full' do
  describe 'airport' do
    it 'raises an error if a plane tries to land when full' do
      plane1 = Plane.new
      plane2 = Plane.new
      airport = Airport.new
      plane1.land(airport)
      expect(airport).to be_full
      expect { plane2.land(airport) }.to raise_error("Sorry, Hangar Full")
    end
  end
end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy
