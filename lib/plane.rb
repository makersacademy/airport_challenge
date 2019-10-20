class Plane
  def land(airport)
    raise 'Too stormy to land' if airport.stormy?
    raise 'Airport is full' if airport.plane_count >= 1

    airport.plane_lands
  end

  def take_off(airport)
    raise 'Too stormy to take off' if airport.stormy?

    airport.plane_takes_off
  end
end
