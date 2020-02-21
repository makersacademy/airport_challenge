require_relative 'plane'

class Airport 
DEFAULT_CAPACITY = 17
attr_accessor :capacity, :plane

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @airport = []
  end

  # User story 1 : the controller can instruct planes to land
  def land(plane)
    @airport << plane
    @plane = plane
  end 

  # User story 2 : the controller can instruct planes to take off
  def take_off
    @airport.pop
  end 
#   def take_off(plane)
#     raise 'This plane has taken off' unless @airport.include?(plane)
#     @airport.delete(plane)
#   end 

end 