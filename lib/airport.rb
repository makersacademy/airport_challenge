require_relative 'plane'
require_relative 'weather' 

class Airport
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'The Airport is full, you cannot land' if full?
    fail 'It is stormy, you cannot land' if stormy?
    @planes << plane
  end

  def takeoff
    fail 'It is stormy, you cannot take off' if stormy?
    @planes.pop
  end

private

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    rand(1..6) > 5
  end

end
