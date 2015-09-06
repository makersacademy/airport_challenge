class Plane

  attr_reader :landed, :location, :flying

  def initialize
    @landed = false
    @flying = true
  end

  def land(airport)
    airport.allow_landing?
    @landed = true
    @flying = false
    @location = airport
  end

  def landed?
    landed
  end

  def take_off
    @landed = false
    @flying = true
    @location = nil
  end

  def flying?
    flying
  end

end
