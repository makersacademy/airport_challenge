class Plane
  attr_reader :plane 
  def land(airport)
    airport.receive(self)
  end
end
