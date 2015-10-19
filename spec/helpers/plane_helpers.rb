module PlaneHelpers

  def set_plane_location_to_in_transit
    plane.update_location('in transit')
  end

  def plane_takes_off
    plane.takes_off
  end

end
