class Plane

  def initialize
    @flying = true
    @landed = false

  end

  def flying?
    @flying
  end

  def landed?
    @landed
  end

  def landing
    @flying = false
    @landed = true

  end

  def take_off

    @flying = true
    @landed = false

  end

end








