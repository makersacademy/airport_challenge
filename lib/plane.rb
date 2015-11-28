class Plane

  def initialize(plane_status = "In-Flight")
    @plane_in_flight = plane_status
  end

  def plane_landing
    @plane_in_flight = "Landed"
  end

  def plane_taking_off
    @plane_in_flight = "In-Flight"
  end

end
