require_relative 'plane'
require_relative 'air_traffic_controller'

class Pilot

  def send_taking_off_permission
    if air_traffic_controller.request_taking_off_permission == :afirmative
      take_off 
    else
      puts "Make another request later"
    end
  end

  def send_landing_permission
    if air_traffic_controller.request_landing_permission == :afirmative
      land
    else
      puts "Make another request later"
    end
  end

  def airport 
    air_traffic_controller.airport
  end

  private

  def air_traffic_controller
    air_traffic_controller ||= AirTrafficController.new
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