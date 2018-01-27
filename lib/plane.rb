class Plane

  def initialize
    @landed = true
  end

  def land(airport)
    raise "Plane already landed" if landed
    airport.land(self)
    @landed = true
  end

  def take_off(airport)
    raise "Plane already flying" unless landed
    airport.take_off(self)
    @landed = false
  end

  private

  attr_reader :landed

end
