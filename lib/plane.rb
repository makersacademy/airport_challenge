
class Plane

  def initialize
    @landed = false

  end

  def landed?
    @landed
  end

  def land(airport)
    @landed = true

  end

end
