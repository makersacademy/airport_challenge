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
    fail "Already flying" if flying
    fail "Airport refuses take off" unless location.allow_take_off?
    location.release_plane(self)
    @flying = true
    @location = nil
  end

  def flying?
    flying
  end

  def landed?
    !flying
  end

end



