require_relative 'airport'

class Plane

  attr_reader :current_status

  def land(airport)
    airport.planes << self
    @current_status = "In airport"
    confirm_landing

  end

  def take_off
    @current_status = "In air"
  end

  def confirm_landing
    "Plane has landed"
  end

  def confirm_take_off
    "Plane has taken off"
  end

end
