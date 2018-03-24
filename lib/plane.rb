class Plane

  DEFAULT_PLANE_NAME = "namerino"
  attr_accessor :name
  
  def initialize(name = DEFAULT_PLANE_NAME)
    @name = name
  end

end
