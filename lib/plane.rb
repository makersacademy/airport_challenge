class Plane

  def initialize
    @landed = false
  end

  def land(airport)
    fail "That isn't an airport!" unless airport.ping == 'I am an airport.'
    fail 'Plane is on ground!' if @landed
    @landed = true
  end

  def takeoff
    fail 'Plane is already flying!' unless @landed
    @landed = false
  end

  def ping
    'I am a plane.'
  end

end
