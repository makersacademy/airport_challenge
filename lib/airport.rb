class Airport

  def land_plane(plane)
    raise("Only planes can be landed") if !plane.instance_of? Plane
    raise("Plane has already landed") if plane.landed_status == true
    plane.landed_status = true
  end

  def has_plane_landed?(plane)
    "yes"
  end
end
