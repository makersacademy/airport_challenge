class Plane
  def initialize
    @landed_at = nil
  end

  def land_at(airport)
    airport.planes << self

    @landed_at = airport
  end
end