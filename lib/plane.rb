class Plane
  attr_accessor :airport

  def initialize(airport = nil)
    @airport = airport
  end

  def land(airport)
    airport.land_plane(self.class)
    @airport = airport
    true
  end

  def takeoff
    @airport.takeoff_plane
    true
  end
end
