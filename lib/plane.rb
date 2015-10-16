class Plane

  def land(airport)
    raise 'The airport is currently full' if airport.full?
    raise 'Cannot land in stormy weather' if airport.weather == 'stormy'
    airport.planes << self

  end

  def take_off

  end

end
