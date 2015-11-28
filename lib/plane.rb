class Plane

  def initialize(plane_status = true)
    @plane_in_flight = plane_status
  end

  def plane_landing
    @plane_in_flight = false
  end

end
