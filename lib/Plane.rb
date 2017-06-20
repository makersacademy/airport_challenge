class Plane
attr_reader :landed

  def initialize
    @landed = false
  end

  def landed
    @landed = true
  end

  def left
    @landed = false
  end
end
