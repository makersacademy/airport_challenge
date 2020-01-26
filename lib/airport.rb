require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 1
  attr_reader :planes, :capacity
  
  def initialize(capacity = DEFAULT_CAPACITY) 
    @planes = []
    @capacity = capacity
  end
  
  def land(plane)
    fail "Airport is full" if full?

    planes.push(plane)
  end

  def takeoff(plane)
    "#{plane} has left"
  end

  private
  def full?
    @planes.length >= capacity
  end

end