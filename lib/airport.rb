require_relative 'plane'

class Airport
  def initialize
    @capacity = 6
  end

  def locate_plane plane
    plane.location
  end

  def landed_planes
    @landed_planes ||= []
  end

  def airborne_planes
    @airborne_planes ||= []
  end

  def weather set_weather = %w(sunny stormy).sample
    set_weather
  end

  def weather_good
    weather == 'sunny'
  end

  def can_land
    landed_planes.length < @capacity
  end

  def landing_permission plane
    fail 'permission denied' if !weather_good || !can_land
    plane.land self
    landed_planes << plane
  end

  def order_plane_takeoff plane
    fail 'permission denied' unless weather_good
    plane.takeoff
    airborne_planes << plane
    landed_planes.delete(plane)
  end
end
