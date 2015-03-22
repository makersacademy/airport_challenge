class Plane
  attr_reader :plane
  def initialize
    @landed = true
  end

  def landed?
    @landed = true
  end

  def taken_off
    @landed = false
  end
end
