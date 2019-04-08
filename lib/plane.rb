class Plane
  attr_reader :landed

  def initialize
    @landed = true
  end

  def landed?
    @landed 
  end

  def taking_off
    @landed = false
  end
end
