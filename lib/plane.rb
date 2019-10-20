class Plane
  def land(airport)
    raise 'Airport is full' if airport.plane_count >= 1

    airport.plane_lands
  end

  def take_off(airport)
    airport.plane_takes_off
  end
end
