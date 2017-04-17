require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 100

  attr_reader :capacity, :hangar

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    fail "Plane already landed!" if plane.is_flying == false
    fail "Error. Airport full." if full?
    fail "Abort. Stormy weather." if stormy?
    hangar << plane
    plane.is_flying = false
    "Plane #{plane} has landed."
  end

  def take_off(plane)
    fail "Plane already flying!" if plane.is_flying
    fail "Plane not in that airport!" unless hangar.include?(plane)
    fail "Abort. Stormy weather." if stormy?
    plane.is_flying = true
    hangar.pop
    "Plane #{plane} has left the airport and is in the air."
  end

  private
  attr_reader :weather

  def full?
    hangar.size >= capacity
  end

  def stormy?
    hangar.stormy?
  end

end
