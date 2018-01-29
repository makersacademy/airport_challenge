require_relative "Plane"

class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    raise "Plane is not airborne" unless airborne?(plane)
    raise "Cannot land in stormy weather" if stormy?
    raise "Cannot land while airport is full" if full?
    plane.landed
    @hangar << plane
  end

  def take_off(plane)
    raise "Plane is already airborne" if airborne?(plane)
    raise "Plane is not in this airport" if at_airport?(plane)
    raise "Cannot take off in stormy weather" if stormy?
    plane.taken_off
    @hangar.delete(plane)
  end

  private

  def stormy?
    rand(10) < 2
  end

  def full?
    @hangar.count >= @capacity
  end

  def at_airport?(plane)
    !@hangar.include?(plane)
  end

  def empty?
    @hangar.empty?
  end

  def airborne?(plane)
    plane.airborne?
  end

end
