class Plane
  def initialize
    @landed = true
  end

  def land airport
    @landed = true
  end

  def take_off
    @landed = false
  end

  def landed?
    @landed
  end
end
