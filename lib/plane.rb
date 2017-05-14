class Plane
  
  def initialize
    @landed = true
  end

  def landed?
    @landed
  end

  def in_flight
    @landed = false
  end
end
