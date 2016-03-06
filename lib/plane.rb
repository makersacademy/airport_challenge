class Plane

  attr_reader :landed

  def initialize
    @landed = false
  end

  def landed?
    @landed
  end

  def land
    @landed = true
  end

  def takeoff
    @landed = false
  end

end
