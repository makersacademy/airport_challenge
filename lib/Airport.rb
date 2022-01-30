require_relative 'aeroplane'
class Airport

  def initialize
    @plane = []
  end

  def land_plane(plane)
    fail 'Airport full' if @plane.count >= 20
    @plane << plane
    plane
  end

  def take_off(plane)
    plane
  end

end