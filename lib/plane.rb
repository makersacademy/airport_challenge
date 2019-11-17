class Plane
  attr_reader :grounded

  def initialize
    @grounded = false # when first created, plane is available to land.
  end

  def land(_airport)
    @grounded = true
  end

  def takeoff(_airport)
    @grounded = false
  end

  def grounded?
    @grounded == true
  end
end
