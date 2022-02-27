class Plane
  attr_accessor :grounded

  def initialize
    @grounded = false
  end

  def grounded?
    @grounded == true
  end
end
