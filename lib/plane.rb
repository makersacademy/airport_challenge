class Plane

  def initialize
    @landed = true
  end

  def landed
    @landed = true
  end

  def landed?
    @landed
  end

  def taken_off
    @landed = false
  end

end
