require_relative 'plane'

class Airport
  def capacity capacity_value = 6
    capacity_value
  end
  # attr_reader :capacity
  # @capacity = 6

  def landed_planes
    @landed_planes ||= []
  end

  def airborne_planes
    @airborne_planes ||= []
  end

  def weather set_weather = 'sunny' # ['sunny', 'stormy'].shuffle
    set_weather
  end

  def weather_good
    weather == 'sunny' # ['sunny']
  end

  def can_land
    landed_planes.length < capacity
  end

  # def landing_permission plane
  #   fail 'permission denied' if !weather_good || !can_land
  #     plane.land
  #     landed_planes << plane
  # end

  def landing_permission plane
    if weather_good && can_land
      plane.land
      landed_planes << plane
    else
      'permission denied'
    end
  end

  def order_plane_to_takeoff plane
    if weather_good
      plane.takeoff
      airborne_planes << plane
      landed_planes.delete(plane)
    else
      'permission denied'
    end
  end
end
