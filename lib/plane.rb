require_relative 'airport.rb'

class Plane

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

  def land(airport)
    airport.hangar << self unless airport.stormy == true || 
    airport.hangar.count >= airport.capacity
  end
  
# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

  def take_off(airport)
    airport.hangar.pop unless airport.stormy == true
    confirm(airport)
  end
  
  def confirm(airport)
    "Take off successful"
  end

end


# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate