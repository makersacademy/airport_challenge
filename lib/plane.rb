class Plane
  
  def initialize
    @landed = false
  end

  def land
    raise 'This plane has already landed!' if landed?
    @landed = true
  end

  def landed?
    @landed
  end

  def take_off
    raise 'This plane is no longer in the airport!' if !landed?
    @landed = false
  end

  def airborne?
    !@landed
  end

end