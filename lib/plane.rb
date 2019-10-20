class Plane
  def land(airport)
    raise "Too stormy to land" if airport.stormy?
  end

  def take_off(airport)
    airport.plane_leaves
  end
end
