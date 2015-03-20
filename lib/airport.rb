class Airport
  def land_plane plane
    plane
  end

  def takeoff_plane
    fail 'No plane to takeoff'
  end
end
