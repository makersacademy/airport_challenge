require_relative 'plane'
# require_relative 'weather'

class Airport
  attr_reader :capacity

  DEFAULT_CAPACITY = 50
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity 
    @hanger = []
  end
  
  def stormy?
  x = Random.rand(1..2)
    if x == 1
      true
    else
      false
    end
  end

  def land(plane)
    @plane = plane
    @hanger.push @plane
    @hanger

  end

  def take_off
    raise "storm" if stormy? == true 
    @hanger.pop
  end



end 

