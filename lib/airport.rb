require_relative 'plane'

class Airport
  attr_accessor :hangar, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    @hangar << plane
  end

  def take_off(plane)
    
  end

end
