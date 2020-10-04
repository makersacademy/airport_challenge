require 'plane.rb'

class Airport
  attr_reader :bunker, :capacity
  DEFAULT_CAPACITY = 125

  def initialize(capacity = DEFAULT_CAPACITY)
    @bunker = []
    @capacity = capacity
  end

  def land(plane)
    return raise "Do not land, airport is full" if full?

    return raise "Plane has already landed" if (plane.flying == false)

    plane.arrived
    @bunker << plane
  end

  def takeoff(plane)
    return raise "No planes available for take off" if empty?

    return raise "Plane not grounded at this airport" if (plane.flying == true)

    plane.departed
    bunker.delete(plane)
    "Flight has departed"
  end

  private
  def full?
    @bunker.length >= @capacity
  end

  def empty?
    @bunker.empty?
  end

end
