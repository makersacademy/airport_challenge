require_relative "weather"
require_relative "plane"

class Airport

  attr_reader :hangar
  DEFAULT_CAPACITY = 10

  include Weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = [].take(@capacity)
    @weather = stormy?
  end
  
  def arrive(plane)
    raise "The Airport is at capacity. No more planes can land." if full?

    raise "Plane cannot land. Bad weather." if stormy?

    plane.land(self)
    in_hangar(plane)
  end
  
  def depart(plane)
    raise "Plane cannot depart. Bad weather." if stormy?

    plane_departed(plane)
  end

  def full?
    @hangar.length >= @capacity
  end
  
  private

  attr_reader :capacity, :weather

  def in_hangar(plane)
    @hangar << plane
  end

  def plane_departed(plane)
    @hangar.delete(plane)
  end

  def correct_airport?(plane)
    hangar.include?(plane)
  end
end
