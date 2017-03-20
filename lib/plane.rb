class Plane
  attr_reader :landed

  def initialize
    @landed = false
  end

  def landing
    @landed = true
  end

  def departuring
    @landed = false
  end
end
