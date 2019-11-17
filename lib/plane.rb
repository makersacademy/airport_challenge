class Plane

  def initialize
    @landed = false
  end
  
  def landed?
    @landed
  end

  def land(airport)
    @airport = airport
    @landed = true
  end

  def take_off
    @airport = nil
    @landed = false
  end

  def inside?(airport)
    @airport == airport
  end

end
