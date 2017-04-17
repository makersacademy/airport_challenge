class Plane
  attr_reader :landed

  def initialize
    @landed = false
  end

  def land
    fail 'Plane in land, cannot land again!' if @landed
    @landed = true
    self
  end

  def take_off
    fail 'Plane in flight, cannot take off again!' unless @landed
    @landed = false
    self
  end
end
