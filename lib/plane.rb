class Plane
  def land(airport)
    airport.hangar.push(self)
    self
  end
end
