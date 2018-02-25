#require_relative 'airport'

class Plane
attr_reader :plane_status
#attr_accessor :plane_ref

  # Plane can be set a reference number for easier tracking
  # By default, given a random number <= airport capacity
  # By default, it is airborne
#  def initialize(plane_ref = rand(CAPACITY::AIR_CAP))
  def initialize(plane_ref = rand(CAPACITY::AIR_CAP))
#    @plane_ref = plane_ref
    @plane_status = "airborne"
  end

  # Method to return string with plane ref and status
  # Use instead of returning object ID
#  def ref
#    "Plane #{@plane_ref}: #{@plane_status}"
#  end

  # Change plane status to "landed" when Airport runs #land_plane
  def landed
    @plane_status = "landed"
  end

  # Change plane status to "airborne" when Airport runs #take_off
  def airborne
    @plane_status = "airborne"
  end

end
