require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :hangar, :capacity

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport full' if full?
    fail 'Plane already landed' if plane_in_hangar(plane)
    @hangar << plane
  end 

  def takeoff(plane)
    fail 'Plane not in airport' unless plane_in_hangar(plane)
    @hangar.delete(plane)
  end

  private

  def full?
    @hangar.length >= @capacity
  end

  def plane_in_hangar(plane)
    @hangar.include?(plane)
  end
end
