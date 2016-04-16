require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 2

  attr_reader :planes, :capacity

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def land(plane)
    raise "Airport full" if full?
    raise "Plane already landed" if @planes.include?(plane)
    plane.landed
    @planes << plane
  end

  def take_off(plane)
    raise "Airport empty" if empty?
    raise "Plane not at airport" if @planes.include?(plane) == false
    plane.departed
    @planes.delete(plane)
  end

  private
  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.empty?
  end

end
