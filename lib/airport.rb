require_relative 'plane'
class Airport
  DEFAULT_CAPACITY = 20

  def initialize
    @planes = []
  end

  def tell_plane_to_land plane
    plane.change_landing_status
  end

  def land_plane plane
    fail 'Plane not cleared for landing' if (plane.able_to_land? == false)
    fail 'Airport is full' if @planes.count >= DEFAULT_CAPACITY
    plane.land_at_airport
    @planes << plane
  end

  def tell_plane_to_take_off plane
    plane.confirm_take_off
  end

  def release_plane plane
  	fail 'No planes available' if (@planes.count == 0)
    plane.take_off
    @planes.delete(plane)
  end

end
