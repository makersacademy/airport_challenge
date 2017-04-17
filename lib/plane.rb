require './lib/airport'

class Plane

  def land(airport)
    raise 'Due to stormy weather, the plane cannot land' if airport.weather.stormy?

    raise 'This airport is full, the plane cannot land' if airport.full?

    airport.park(self)
  end

  def take_off(airport)
    raise('A plane needs to be parked first before it can take off') unless airport.parked?(self)

    raise 'Due to stormy weather, the plane cannot take off' if airport.weather.stormy?

    airport.en_route(self)
  end

end
