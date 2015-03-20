require_relative 'plane'

class Airport
  capacity = 6

  def landed_planes
    @landed_planes ||= []
  end

  def airborne_planes
    @airborne_planes ||= []
  end

  def weather
    'sunny'
  end

  def can_takeoff
    weather == 'sunny'
  end

  def can_land
    landed_planes.length < capacity
  end

  def landing_permission plane
    plane.land
    landed_planes << plane
  end

  def request_plane_to_takeoff plane
    if can_takeoff
      plane.takeoff
      airborne_planes << plane
      landed_planes.delete(plane)
    else
    end
  end
end
