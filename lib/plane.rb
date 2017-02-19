require_relative 'airport'
require_relative 'weather'

class Plane
  include Weather

  attr_reader :current_status

  def land(airport)
    checks_before_landing(airport)
    airport.planes << self
    @current_status = "In airport"
    confirm_landing
  end

  def take_off(airport)
    checks_before_takeoff(airport)
    airport.planes.delete(self)
    @current_status = "In air"
    confirm_take_off
  end

private

  def checks_before_landing(airport)
    fail "Plane is already in airport" unless able_to_land?
    fail "Plane cannot land due to stormy weather" if unsuitable_weather?
    fail "Airport is full" if airport.full?
  end

  def checks_before_takeoff(airport)
    fail "Plane is not in this airport" unless able_to_take_off?(airport)
    fail "Plane cannot take off due to stormy weather" if unsuitable_weather?
  end

  def able_to_land?
    self.current_status != "In airport"
  end

  def able_to_take_off?(airport)
    airport.planes.include? self
  end

  def confirm_landing
    "Plane has landed"
  end

  def confirm_take_off
    "Plane has taken off"
  end

  def unsuitable_weather?
    stormy?
  end

end
