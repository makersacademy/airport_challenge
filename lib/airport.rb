require_relative 'plane'

class Airport

  attr_reader :landed_planes, :airport_capacity

  def initialize(capacity)
    @landed_planes = []
    @airport_capacity = capacity
  end

  def land_plane(plane)
    raise "no space" if full?
    @landed_planes << plane
    "#{plane} landed"
  end

  def take_off(plane)
    @landed_planes.delete(plane)
  end

  private

  def full?
    @landed_planes.size >= airport_capacity 
  end

end