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

  def request_plane_to_takeoff plane

  end
end
