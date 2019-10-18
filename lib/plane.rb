class Plane
  attr_accessor :landed_at

  def initialize
    @landed_at = nil
  end

  def land_at(airport)
    airport.planes << self

    @landed_at = airport
  end

  def take_off
    position = @landed_at.planes.index(self)
    @landed_at.planes.delete_at(position)
    @landed_at = nil
  end
end