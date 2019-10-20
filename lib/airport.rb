require_relative 'plane'

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 

class Airport
  attr_accessor :hangar, :stormy, :capacity

  def initialize
    @hangar = []
    @capacity = 1
    # @stormy = true if rand[10] == 9 
  end
  
end


# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate