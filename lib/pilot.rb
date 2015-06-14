require_relative 'plane'
require_relative 'air_traffic_controller'

class Pilot

  def send_taking_off_permission
    take_off if (air_traffic_controller.request_taking_off_permission == :afirmative)
  end

  def send_landing_permision
    land if air_traffic_controller.request_landing_permission == :afirmative 
  end

  def airport 
    air_traffic_controller.airport
  end

  private

  def air_traffic_controller
    AirTrafficController.new
  end

  def plane
    Plane.new
  end

  def take_off
    plane.take_off airport
  end

  def land
    plane.land airport
  end

end