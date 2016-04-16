class Plane
  def initialize
    @landed = false
  end

  def land(airport)
    @landed=true
    @airport= airport
  end

  def landed?
    @landed
  end
end