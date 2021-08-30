require_relative 'plane'

class Airport
  attr_reader :plane
  # def land_plane
  # end

  def land(plane)
    @plane = plane
  end

  def take_off_plane
    Plane.new
  end

end