class Plane

  attr_reader :landed

  def initialize
    @landed = true
  end

  def take_off
    @landed = false
  end

  def land
    @landed = true
  end

end
