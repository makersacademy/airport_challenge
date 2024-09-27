# ACT ASSERT ARRANGE

# User Story 1 - Plane land
# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport I want to prevent landing when the airport is full 

require 'Airport.rb' # classes required

describe Airport do # only have to write once with 'its' underneath
  let( :airport ) { Airport.new } # this createa an Airport.new for each test so you don't have to write it our each time

    it 'instruct plane to land' do
      expect { airport.land(plane) }
    end

# User Story 2 - Plane take off
# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

    it 'plane can take off' do
      expect { airport.take_off(plane) }
    end

# User Story - 3 Airport capacity
# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

    it 'if airport full plane cannot land' do
      expect { airport.full?(21) }
    end
end

# User story 4 - More than one airport
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate
# Cannot do this user story