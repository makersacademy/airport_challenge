class Plane
  attr_reader :landed
  attr_writer :landed

  def initialize
    @landed = false
  end

  def land
    @landed = true
  end

  def takeoff
    @landed = false
  end

end
