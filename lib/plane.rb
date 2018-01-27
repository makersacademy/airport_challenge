class Plane

  attr_reader :landed

  def initialize
    @landed = true
  end

  def land(airport)
    @landed = true
    airport
  end

end
