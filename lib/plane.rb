class Plane

  attr_reader :landed

  def initialize
    @landed = false
  end

  def land(airport)
    fail 'Plane is on ground!' if @landed
    @landed= true
    airport.park_plane(self)
  end

  def takeoff(airport)
    fail 'Plane is already flying!' unless @landed
    @landed = false
    airport.launch_plane(self)
  end

end
