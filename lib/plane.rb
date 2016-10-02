class Plane

  def initialize
    @landed = false
  end
  def landed?
    @landed
  end
  def confirm_land
    @landed = true
  end
  def confirm_takeoff
    @landed = false
  end
end
