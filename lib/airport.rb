require_relative 'plane'

class Airport
  def plane_land(plane)
  end

  def plane_take_off(plane)
    plane.leave_airport
  end
end
