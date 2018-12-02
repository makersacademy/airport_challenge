require_relative 'plane'

class Airport
  attr_reader :capacity

  DEFAULT_CAPACITY = 1
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity 
    @hanger = []
  end
    

  def land(plane)
    @plane = plane
    @hanger.push @plane

  end

  def take_off
    @hanger.pop
  end



end 

