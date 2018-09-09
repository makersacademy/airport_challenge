class Plane
  attr_accessor :landed

  def initialize(bool = false)
    @landed = bool
  end

  def landed?
    @landed
  end
end
