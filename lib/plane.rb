require 'weather'

class Plane

  def land(airport, weather = Weather.new)
    raise "Can't land, too stormy" if weather.stormy?
    raise "Airport full" if airport.full?

    airport.parked += 1
    "Landed at #{airport.name}"
  end

  def takeoff(airport, weather = Weather.new)
    raise "Can't take off, too stormy" if weather.stormy?

    airport.parked -= 1
    "Departed from #{airport.name}"
  end

end
