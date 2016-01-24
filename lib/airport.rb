require_relative 'plane'

class Airport

  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity= DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise "Airport full!" if @planes.count >= @capacity
    plane.land
    @planes << plane
  end

  def plane_takes_off(plane)
    plane.take_off
    @planes.pop
    @planes
  end


end
