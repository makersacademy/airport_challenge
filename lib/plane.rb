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

  def check?
    @landed ? "Plane is on the land" : "Plane is in the air"
  end
end
