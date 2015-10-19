class Plane
  attr_accessor :location
  def initialize
    @location = "Airborne"
    @flying_status = true
  end

  def flying?
    @flying_status
  end

  def flying
    @flying_status = true
  end

  def grounded
    @flying_status = !@flying_status
  end

end
