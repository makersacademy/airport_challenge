class Plane
  attr_reader :landed

  def initialize
    @landed = false
  end

  def land(airport)
    raise "The plane is already on the ground" if @landed
    @landed = true if airport.authorize_landing(self)
  end

  def take_off(airport)
    raise "The plane is already in flight" unless @landed
    @landed = false if airport.authorize_take_off(self)
  end
end
