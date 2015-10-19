class Plane
  # attr_reader :flying, :location
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

  def location
  end
end
