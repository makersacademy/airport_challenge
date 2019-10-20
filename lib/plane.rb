class Plane
  def land(airport)
    raise 'Too stormy to land' if airport.stormy?
  end

  def take_off(airport)
    raise 'Too stormy to take off' if airport.stormy?

    airport.plane_leaves
  end
end
