class Plane
  attr_accessor :plane
  def land(airport)
    airport.planes << self
  end
end 