class Plane
  
  def initialize
    @landed = false
  end

  def land
    @landed = true
  end

  def landed?
    @landed
  end

  def take_off
    @landed = false
  end

end