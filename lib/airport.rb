require 'Weather'

class Airport

  def land_plane(plane)
    raise("Only planes can be landed") if !plane.instance_of? Plane
    raise("Plane has already landed") if plane.landed_status == true
    plane.landed_status = true
    "#{plane} has landed"
  end

  def has_plane_landed?(plane)
    return "yes" if plane.landed_status == true
    "no" if plane.landed_status == false
  end

  def take_off(plane, weather)
    raise("Plane is still in the air") if plane.landed_status == false

    if weather.today == "stormy"
      "Unable to take off because of the stormy weather"
    else
    plane.landed_status = false
    "#{plane} has taken off"
    end
  end


end
