require_relative 'planes'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(a_plane)
    @planes.push(a_plane)
  end

  def take_off(a_plane)
    @planes.delete(a_plane)
  end

  def landed_planes
    @planes
  end

end
