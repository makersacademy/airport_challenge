class Plane

  def initialize(plane_is_landed = false)
    @plane_is_landed = plane_is_landed
  end

  def plane_is_landed?
    @plane_is_landed
  end

  def proceed_to_land
    @plane_is_landed = true
  end
end
