require 'Weather'

class Airport

attr_accessor :weather

  def initialize
    @weather = Weather.new.todays_weather
  end

  def land_plane(plane)
    raise("Only planes can be landed") if !plane.instance_of? Plane
    raise("Plane has already landed") if plane.landed_status == true

    if @weather == "Stormy"
      "Unable to land plane in stormy weather"
    else
    plane.landed_status = true
    "#{plane} has landed"
    end

  end

  def has_plane_landed?(plane)
    return "yes" if plane.landed_status == true
    "no" if plane.landed_status == false
  end

  def take_off(plane)
    raise("Plane is still in the air") if plane.landed_status == false

    if @weather == "Stormy"
      "Unable to take off because of the stormy weather"
    else
    plane.landed_status = false
    "#{plane} has taken off"
    end
  end


end
