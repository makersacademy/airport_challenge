class Plane
  attr_accessor :landed

  def initialize(status = false)
    @landed = status
  end

  def landed?
    landed
  end
end
