require_relative 'airport'

class Plane

  def land(airport)
    airport.planes << self
    confirm_landing
  end

  def take_off

  end

  def confirm_landing
    "Plane has landed"
  end

  def confirm_take_off
    "Plane has taken off"
  end

end
