require_relative 'plane'

class Airport
  def landed_planes
    @landed_planes ||= []
  end

  def airborne_planes
    @airborne_planes ||= []
  end

  def landing_permission plane
    plane.land
    landed_planes << plane
  end

  # the probem is that we are not able to delete
  # the planes from the landed planes array
  # as we are putting them into the airborne planes array

  def request_plane_to_takeoff plane
    plane.takeoff
    airborne_planes << plane

    landed_planes.delete(plane)
    # landed_planes.pop
  end
end
