require_relative "plane"

class Airport

  attr_reader :hangar

  DEFAULT_CAPACITY = 2

  def initialize
    @hangar = []
  end

  def full
    @hangar.length >= DEFAULT_CAPACITY
  end

  def land(plane)
    raise "Airport is full" if full

    @hangar << plane
    @hangar
  end
  
  def take_off(plane)
    @hangar.delete(plane)
    @hangar
  end

end
