class Plane
  def land(airport)
    airport.receive(self)
    return "Plane landed at #{airport.name} (#{airport.code})"
  end

end