# require './lib/plane'

class Airport

   attr_reader :capacity

  def initialize
    @capacity = [] 
  end

  def land(plane)
    @capacity << plane
    plane
  end

  def take_off(plane)
    @plane = plane
  end
  
end
