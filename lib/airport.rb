require_relative 'plane'

class Airport

  attr_accessor :weather_status

  def request_landing(plane)
    raise "Cannot land in bad weather" if weather_status == "Stormy"
    plane.land
  end

  def request_take_off(plane)
    raise "Cannot take off in bad weather" if weather_status == "Stormy"
    plane.take_off
  end

end
