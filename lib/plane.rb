class Plane

  attr_reader :location, :flying

  def initialize
    @flying = true
  end

  def land(airport)
    fail "Already landed" unless flying
    fail "Airport refuses landing request" unless airport.allow_landing?
    @flying = false
    @location = airport
    airport.receive_plane(self)
  end

  def take_off
    location.release_plane(self)
    @flying = true
    @location = nil
  end

  def landed?
    !flying
  end

  def flying?
    flying
  end

end



