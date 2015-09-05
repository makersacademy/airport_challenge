require_relative 'plane'
class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :capacity
  def initialize (capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @planes << Plane.new("landed")
  end

  def commence_take_off
    plane = @planes.pop
    plane.take_off
  end

  def land(plane)
  @planes << plane
  plane.landed
  end

  def planes
    @planes
  end

  def count_planes
   @planes.count
  end

end
