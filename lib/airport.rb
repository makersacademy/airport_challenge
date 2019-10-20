require_relative 'plane'

class Airport
  def initialize(capacity)
  @capacity = capacity
  @planes = []
  end
  def land(plane)
    raise 'Plane cannot land :Airport full' if @planes.length >= @capacity
    @planes << plane
  end

  def take_off(plane)
  end

  def stormy?
    rand(1..6) > 4
  end
end