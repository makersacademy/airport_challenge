require 'planes'
class AirPort

  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
   @planes = []
   @capacity = DEFAULT_CAPACITY

  end

  def land_safely(planes, working=true)
   fail 'airport is full' if full?
   @planes << planes
  end

  def full?
   @planes.count >= @capacity
  end

  def take_off_safely(plane)
   fail 'can not take off' if stormy?
   @planes.delelte(planes)
  end

  def stormy?
   true
  end

  def flying?
    true
  end

  def non_flying?
    true
  end

end
