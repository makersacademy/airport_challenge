class Airport

  def land_plane(plane)
    raise("Only planes can be landed") if !plane.instance_of? Plane
    raise("Plane has already landed") if plane.landed_status == true
    plane.landed_status = true
  end

  def has_plane_landed?(plane)
    return "yes" if plane.landed_status == true
    "no" if plane.landed_status == false
  end

  def take_off(plane)
    raise("Plane is still in the air") if plane.landed_status == false
    plane.landed_status = false
    "Plane has taken off"
  end

  def is_plane_at_airport?(plane)
    if plane.landed_status == true
      "yes"
    else
     "no"
    end
  end

end
