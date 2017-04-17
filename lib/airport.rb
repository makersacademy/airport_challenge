require_relative 'plane.rb'
require_relative 'weather'

class Airport
  attr_reader :planes, :sky, :capacity

  DEFAULT_CAPACITY = 50
  DENIED = 'Permission denied: '

  def initialize(capacity = DEFAULT_CAPACITY,weather_klass)
    @planes = []
    @weather_klass = weather_klass
    @sky = weather_klass.new
    @bad_weather = 'the weather is too dangerous.'
    @capacity_full = 'the airport is full.'
    @in_hanger = 'The plane is already in the airport.'
    @not_in_hanger = 'The plane is not in the airport'
    @capacity = capacity
  end

  def planes
    @planes.dup
  end

  def land_plane(plane)
    raise DENIED + @capacity_full if planes.length >= capacity
    raise @in_hanger if planes.include?(plane)
    raise DENIED + @bad_weather if check_weather(sky)
    plane.touch_down
    @planes << plane
  end

  def clear_plane_for_take_off(plane)
    raise @not_in_hanger if !planes.include?(plane)
    raise DENIED + @bad_weather if check_weather(sky)
    plane.cleared
    @planes.delete(plane)
  end

  private

  def check_weather(weather)
    weather.stormy?
  end
end
