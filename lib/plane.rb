require_relative 'plane'

class Plane

  attr_reader :plane
  attr_reader :plane_status

  def initialize(airport)
    @plane_status = airport
    @plane = self
    airport.add_to_hangar(@plane)
  end

  def status_update(new_status)
    @plane_status = new_status
  end

  def land(airport)
    airport.add_to_hangar(@plane)
    @plane_status = airport
  end

  def take_off
    @plane_status.remove_from_hangar(self)
    status_update("airborne")
  end

end
