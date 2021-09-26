# ACT ASSERT ARRANGE

# User Story 1 - Plane land
# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

require 'Airport.rb'

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
end
