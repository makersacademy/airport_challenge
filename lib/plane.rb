class Plane
  attr_reader :plane_status
  def initialize(plane_status = :landed)
    @plane_status = plane_status
  end

  def land
    @plane_status = :landed
  end

  def take_off
    @plane_status = :air
  end
end
