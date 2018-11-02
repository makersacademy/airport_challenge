class Plane

  def initialize
    @landed
    @flying
  end

  def landed?
    @landed = true
    @flying = nil
  end

  def flying?
    @flying = true
    @landed = nil
  end
end
