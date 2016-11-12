require_relative 'plane'

class AirportController

  attr_reader :planes

  def initialize
    @planes
  end

  def land_plane(plane)
    plane.landed?
    @planes = plane
  end

  def take_off_plane
    Plane.new
  end



end
