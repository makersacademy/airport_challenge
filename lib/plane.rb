class Plane
  def initialize
    @landed = false
    @takeoff = false
  end

  def land
    @landed = true
  end

  def has_landed?
    @landed
  end

  def take_off
    @takeoff = true
  end

  def has_taken_off
    @takeoff
  end
end
