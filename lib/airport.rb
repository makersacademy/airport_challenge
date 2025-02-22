require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 1
  attr_accessor :capacity
  attr_reader :planes
  
  def initialize(capacity = DEFAULT_CAPACITY) 
    @planes = []
    @capacity = capacity
  end
  
  def land(plane)
    fail "Airport is full" if full?

    fail "Weather is stormy" if stormy?

    planes.push(plane)
  end

  def takeoff(plane)
    fail "Weather is stormy" if stormy?
    
    "#{plane} has left"
  end

  def stormy?
    rand(2).zero?
  end

  private
  def full?
    @planes.length >= capacity
  end
end