class Airport
  attr_reader :hangar, :DEFAULT_CAPACITY
  
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @DEFAULT_CAPACITY = capacity
  end

  def land_plane(plane)
    fail "Hangar Full" if full?
    
    @hangar << plane
  end

  def take_off(plane)
    @hangar.delete(plane)
  end

  def plane_check(plane)
    @hangar.include?(plane)
  end

 private
  def full?
    @hangar.length >= @DEFAULT_CAPACITY
  end
  
end

class Plane
  #status landed or air
end

module Weather

  def stormy?
  #rand
  end
  
end