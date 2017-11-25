require 'weather'

class TrafficController
  def land_to(plane, airport)
    true
  end

  def takeoff_from(plane, airport)
    if weather.stormy?
      false
    else
      true
    end
  end

  def weather
    Weather.new
  end
end
