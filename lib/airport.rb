require './lib/plane'

class Airport
  def take_off
    Plane.new
    #plane_left_hangar()
  end

  def plane_left_hangar
    "Plane has left the airport"
  end

end
