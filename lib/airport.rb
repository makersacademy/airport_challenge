require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @capacity = 6
    @planes = []
  end

  def land_plane(plane)
    fail 'No Space' if @planes.count >= @capacity
    fail 'Bad Weather' if bad_weather?
    plane.land!
    @planes << plane
  end

  def plane_fly(plane)
    fail 'No Planes' if @planes.empty?
    plane
  end
end
