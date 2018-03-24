class Plane

  DEFAULT_PLANE_NAME = "Just a plane"
  attr_accessor :name

  def initialize(name = DEFAULT_PLANE_NAME)
    @name = name
  end

end
