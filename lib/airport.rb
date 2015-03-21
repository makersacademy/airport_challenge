require_relative 'plane'

class Airport
  @capacity = 6

  def landed_planes
    @landed_planes ||= []
  end

  def airborne_planes
    @airborne_planes ||= []
  end

  def weather set_weather = 'sunny'
    set_weather
  end

  def weather_good
    weather == 'sunny'
  end

  def can_land
    landed_planes.length < @capacity
  end

  def landing_permission plane
    if weather_good && can_land
      plane.land
      landed_planes << plane
    else
      'permission denied'
    end
  end

  def request_plane_to_takeoff plane
    plane.takeoff
    airborne_planes << plane
    landed_planes.delete(plane)
  end
end
