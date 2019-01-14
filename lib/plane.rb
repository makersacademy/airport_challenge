class Plane
  def initialize
    @location = :air
  end

  def land(airport)
    airport.planes << self if location == :air && airport.permission_land?
  end

  def depart(airport)
    location = :air && airport.planes.delete(self) if airport.permission_depart?
  end

  private

  attr_accessor :location
end
