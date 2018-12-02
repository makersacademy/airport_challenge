require_relative 'plane'

class Airport
  attr_reader :capacity

  DEFAULT_CAPACITY = 50
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity 
    @hanger = []
  end
    

  def land(plane)
    @plane = plane
    @hanger.push @plane

  end

  def take_off
    #we need the plane to leave the airport 
  end



end 

