class Plane
  attr_accessor :parked

  def initialize
    @parked = false
  end

  def land(airport)
    fail 'Plane is parked!' if @parked
    airport.park_plane(self)
    @parked = true
  end

  def takeoff(airport)
    fail 'Plane is already flying!' unless @parked
    airport.launch_plane(self)
    @parked = false
  end

end
