require_relative 'aeroplane'
class Airport

  def initialize
    @plane = []
    @planes_landed = 0
  end

  def land_plane(plane)
    fail 'Airport full' if @plane.count >= 20
    @plane << plane
    @planes_landed +=1
    plane
  end

  def take_off(plane)
    plane
  end

end