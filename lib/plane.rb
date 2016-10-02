class Plane
  attr_reader :landed
  attr_reader :airport

  def land(airport = nil)
    @landed = true
    @airport = airport
  end

  def take_off
    @landed = false
  end
end
