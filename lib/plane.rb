class Plane

  attr_reader :on_ground

  def land(airport)
    @landed = true
    @on_ground = true
  end

end
