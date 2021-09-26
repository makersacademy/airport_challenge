# plane - instruct to land
# Plane - instruct to take off

class Plane

  attr_accessor :landed

  def initialize
    @landed = false
  end

  def plane_has_landed
    @landed = true
  end

  def plane_is_flying
    @landed = false
  end

end