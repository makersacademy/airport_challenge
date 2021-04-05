require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 2
  attr_reader :planes
    
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
   
  end
  
  def land(plane)
    raise 'Airport full:take off a plane to land this one' if full?
    
    raise 'cant land, is stormy' if stormy?

    plane.land(self)
    add_plane(plane)
  end
  
  def take_off(plane)
    raise 'cant take off, is stormy' if stormy?
    raise 'cant take off, already flying' unless in_airport?(plane)
    plane.take_off
    del_plane(plane)
    plane
  end
  
  private 
  
  attr_reader :capacity, :planes
  
  def full?
    planes.length >= capacity
  end
  
  def stormy?
    rand(1..6) > 4
  end

  def in_airport?(plane)
    planes.include?(plane)
  end

  def del_plane(plane)
    planes.delete(plane)
  end
  def add_plane(plane)
    planes << plane
  end
end
