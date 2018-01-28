require_relative "Plane"

class Airport
  DEFAULT_CAPACITY = 1
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Cannot land, airport full" if full?
    @planes << plane
    plane.landed?
  end

  def take_off(plane)
    raise "No planes available" if empty?
    @planes.delete(plane)
    plane.flying?
  end

  def empty?
    @planes.empty?
  end

  def full?
    true if @planes.size >= @capacity
  end
end
