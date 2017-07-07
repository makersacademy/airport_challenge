class Plane

  def initialize
    @landed = false
  end

  def take_off
    @landed = false
  end

  def landing
    @landed = true
  end

  def status?
    @landed
  end
end
