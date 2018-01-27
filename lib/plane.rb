class Plane

  attr_reader :landed

  def initialize
    @landed = true
  end

  def land(airport)
    raise "Plane already landed" if @landed
    airport.land(self)
    @landed = true
  end

  def take_off(airport)
    airport.take_off(self)
    @landed = false
  end

end
