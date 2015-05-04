require_relative 'plane'

class Airport

  def initialize
    @capacity = 10
  end

  def landed_planes
    @landed_planes ||=[]
  end

  def weather_sunny?
    weather == 'sunny'
  end

  def permission_to_land plane
    fail 'permission denied' if
  end

  def location_of plane
    plane.location
  end
end
