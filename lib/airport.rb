require_relative 'plane'
class Airport

  def tell_plane_to_land plane
    plane.change_landing_status
  end

  def land_plane plane
    fail 'Plane not cleared for landing' if (plane.able_to_land? == false)
    plane.land_at_airport
  end

  def tell_plane_to_take_off plane
    plane.confirm_take_off
  end

  def release_plane plane
    plane.take_off
  end

end
