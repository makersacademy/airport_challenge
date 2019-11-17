class Plane
  attr_reader :airport

  def initialize
    @flying = true
    # we assume upon creation the plane is in flight, alternatively could have
    # a default airport the planes are stored in upon creation
    @airport = nil
  end

  def flying?
    @flying
  end

  def land(airport)
    @flying = false
    @airport = airport
  end

  def take_off
    @flying = true
    @airport = nil
  end

end
