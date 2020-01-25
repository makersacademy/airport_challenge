require 'plane'



# my first test - checks if class exists
describe Plane do
    it 'checks if plane exists' do
        expect(subject).to be_a Plane
    end
end 


# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport
