require_relative '../lib/plane'

class Airport

  def plane_takeoff
    plane = Plane.new
    plane
  end

  def land_plane(plane)
   plane
  end

  def confirm_takeoff(plane)
    "#{plane.to_s} has now taken off"
  end

end
