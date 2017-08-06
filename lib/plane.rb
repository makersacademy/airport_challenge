class Plane

  attr_accessor :landed

  def initialize
    @landed = false
  end

  def land
    @landed = true
  end

  def takeoff
    @landed = false
  end

  def landed?
    @landed
  end

end
