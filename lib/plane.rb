class Plane

  def land(airport, weather)
    raise 'Airport full' if airport.full?
    raise 'Unsafe to land' if weather.stormy?
    airport.stored_planes.push(self)
  end

end
