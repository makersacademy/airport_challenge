class Plane

  attr_accessor :grounded

  def initialize(status = true)
    @grounded = status
  end

  def grounded?
    grounded
  end

end
