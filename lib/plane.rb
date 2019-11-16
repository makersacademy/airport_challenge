class Plane

  def initialize
    @grounded = false # when first created, plane is available to land.
  end

  def grounded
    @grounded = true
    :grounded
  end

  def flying
    @grounded = false
    :flying
  end

  def available_to_land?
    @grounded == false
  end
end
