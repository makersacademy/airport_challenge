require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    stormy?
    raise "Too stormy to land" if @stormy
    raise "Airport full, no space to land" if @planes.size >= @capacity

    @planes << plane
  end

  def take_off
    stormy?
    raise "Too stormy to take off!" if @stormy

    @planes.pop
    "plane has left the airport"
  end

  def stormy?
    rand(1..5) == 5 ? @stormy = true : @stormy = false
  end
end
