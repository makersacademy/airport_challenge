class Plane

  def land(airport)
    @airport = airport
    @airport.dock(self)
  end

  def takeoff
    @airport.docking_bay.delete(self)
  end

end