class Plane

  def land(airport)

    fail "Airport is full!" if airport.full?
    fail "Too stormy to land!" if airport.stormy?

    airport.dock(self)

  end

end
