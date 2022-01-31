 require_relative 'aeroplane'
class Airport
  def initialize
    @plane = []
    @planes_landed = 0
  end
  def land_plane(plane)
    fail 'Airport full' if full?
    @plane << plane
    @planes_landed += 1
    plane
  end
  def takeoff_plane(plane)
    plane
  end

  private
  def full?
    @plane.count >= 20
  end
end
