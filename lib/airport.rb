require_relative 'plane'

class Airport

  def initialize
  	@planes = []
  end

  def land_plane(plane)
  	plane.landed
  	@planes << plane
  end

  def take_off(plane)
  	plane.has_taken_off
  	@planes.pop
  end

end
