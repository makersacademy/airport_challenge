class Plane
  def initialize(landed)
    @landed = landed
  end

  def land!
    @landed = true
  end

  def take_off!
    @landed = false
  end

  def landed?
    @landed
  end

  def flying?
    !landed?
  end
end
