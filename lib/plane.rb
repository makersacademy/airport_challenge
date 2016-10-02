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
    raise "This plane is no longer in the airport" if !landed?
    @landed = false
  end

end