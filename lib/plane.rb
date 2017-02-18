require_relative 'airport'

class Plane

  attr_reader :current_status

  def land(airport)
    fail "Plane is already in airport" unless able_to_land?
    airport.planes << self
    @current_status = "In airport"
    confirm_landing

  end

  def able_to_land?
    self.current_status != "In airport"
  end

  def able_to_take_off?(airport)
    airport.planes.include? self
  end

  def take_off(airport)
    fail "Plane is not in this airport" unless able_to_take_off?(airport)
    @current_status = "In air"
    confirm_take_off
  end

  def confirm_landing
    "Plane has landed"
  end

  def confirm_take_off
    "Plane has taken off"
  end

end
