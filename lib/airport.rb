require_relative 'weather'

class Airport
  
  DEFAULT_CAPACITY = 30

  attr_accessor :planes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'Airport is full' if full?
    @planes.push(plane)
  end

  def take_off(plane)
    @left_airport = true
    @planes - [plane]
  end
  
  def left_airport?
    @left_airport
  end

  private

  def full?
    @planes.length >= @capacity
  end

end
