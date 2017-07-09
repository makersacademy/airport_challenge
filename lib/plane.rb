class Plane

  attr_accessor :landed

  def land(airport)
    @landed = true
    airport
  end

end
