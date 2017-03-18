require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    add_plane(plane)
    plane.landed?
  end

  def add_plane(plane)
    planes << plane
  end

  def take_off
    planes.pop
    planes
  end

end
