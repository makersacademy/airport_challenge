require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 30
  
  def initialize( capacity=DEFAULT_CAPACITY ) 
    @capacity = capacity  # every new instance of airport will have a default capacity of 30, unless the system designer overrides this by setting a different capacity. 
    @planes = [] # every new instance of airport will have a planes array that stores how many planes are currently landed
  end

  def depart
    raise "There are no planes at the airport to depart!" if empty? #is this what instructions mean by "defending against edge cases"?
    @planes.pop
    @planes
  end

  def land(plane)
    raise "Airport is full! No planes can land here." if full?
    @planes << plane
  end

  private 

  def full?
    @planes.length >= capacity
  end

  def empty?
    @planes.empty?
  end


end