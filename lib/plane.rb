class Plane

  DEFAULT_PLANE_NAME = "Just a plane"
  attr_accessor :name
  attr_accessor :airborne

  def initialize(name = DEFAULT_PLANE_NAME)
    @name = name
    @airborne = true
  end

  def flying?
    @airborne
  end

end
