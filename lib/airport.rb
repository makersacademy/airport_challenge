require_relative 'plane'
require_relative 'weather'
require_relative 'messages_module'

class Airport
include Messages

  attr_reader :landing_bay, :capacity

DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @landing_bay = []
    @capacity = capacity
  end

  def store_plane(plane)
    if landing_bay_same_as_capacity?
      return loading_bay_is_too_full_to_land_planes
    else
      allow_plane_to_land_on_landing_bay(plane)
    end
  end

  def force_plane_to_take_off(plane)
    if the_weather_is_sunny?
        puts plane_taken_off_message
        plane.switch_flying
        return delete_plane_from_the_landing_bay(plane)
    else
        puts bad_weather_message
    end
  end

  private

  def landing_bay_same_as_capacity?
    @landing_bay.length == @capacity
  end

  def the_weather_is_sunny?
    Weather.new.right_now == "Sunny"
  end

  def delete_plane_from_the_landing_bay(plane)
     @landing_bay.delete(plane)
  end

  def allow_plane_to_land_on_landing_bay(plane)
    @landing_bay << plane
  end

end
