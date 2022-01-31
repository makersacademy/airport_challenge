# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 

require_relative './docs/plane'

describe Plane do
    subject {Class.new}
  
    it 'Plane is flying.  Responds to the flying method.' do
      expect(subject).to respond_to (:flying?)
    end
  
    it 'Plane has landed and so is not flying' do
      subject.land?
      expect(subject).not_to respond_to (:flying?)
    end
  end