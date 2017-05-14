class Plane
  attr_reader :landed

  def initialize
    @landed = false
  end

  def land(airport)
    @landed = true if airport.authorize_landing(self)
  end

  def take_off(airport)
    @landed = false if airport.authorize_take_off(self)
  end
end
