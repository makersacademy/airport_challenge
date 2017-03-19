class Planes
  attr_reader :plane_landed

  def initialize
    @plane_landed = true
  end

  def take_off
    @plane_landed = false
  end

  def land
    @plane_landed = true
  end

end
