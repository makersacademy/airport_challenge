class Plane
  def initialize
   @landed = false
  end

  def land
    raise? "plane already on the ground" if landed?
    @landed = true
  end

  def take_off
    @landed = false
  end

private
  def landed
    @landed
  end

end
