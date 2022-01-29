require_relative '../lib/plane'

class Airport

  DEFAULT_CAPACITY = 10
  FULL_CAPACITY_ERR = 'Airport at full capacity.'.freeze
  STORMY_WEATHER_ERR = 'Weather is stormy.'.freeze
  PLANE_NOT_AT_AIRPORT_ERR = 'Plane not at airport'.freeze

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @airport_capacity = capacity
    @planes = []
    @weather = weather
  end

  def take_off(plane)
    raise STORMY_WEATHER_ERR if stormy?
    raise PLANE_NOT_AT_AIRPORT_ERR unless plane_at_airport?(plane)
 
    remove_plane_from_airport(plane).take_off

  end

  def land(plane)
    raise_error_on_landing
    @planes << plane.land
  end

  private

  def remove_plane_from_airport(plane)
    @planes.delete_at(airport_location_of_plane(plane))
  end

  def raise_error_on_landing
    raise STORMY_WEATHER_ERR if stormy?
    raise FULL_CAPACITY_ERR if airport_full?
  end

  def plane_at_airport?(plane)
    !airport_location_of_plane(plane).nil?
  end

  def airport_location_of_plane(plane)
    @planes.index { |landed_plane| landed_plane.object_id == plane.object_id } 
  end

  def airport_full?
    @planes.size == @airport_capacity
  end

  def stormy?
    @weather.stormy?
  end
end
