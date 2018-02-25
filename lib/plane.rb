class Plane
  attr_reader :plane_status, :plane_ref

  def initialize(plane_ref = rand(CAPACITY::AIR_CAP))
    @plane_ref = plane_ref
    @plane_status = "airborne"
  end

  # Change plane status to "landed" when Airport runs #land_plane
  def landed
    @plane_status = "landed"
  end

  # Change plane status to "airborne" when Airport runs #take_off
  def airborne
    @plane_status = "airborne"
  end

end
