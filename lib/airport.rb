require 'weather.rb'

class Airport
  attr_reader :planes, :sky, :denied, :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @sky = Weather.new
    @denied = 'Permission denied, the weather is too dangerous.'
    @capacity = capacity
  end

  def planes
    @planes.dup
  end

  def land_plane(plane)
    raise denied if check_weather(sky)
    raise 'Permission denied, the airport is full.' if planes.length >= capacity
    plane.touch_down
    @planes << plane
  end

  def clear_plane_for_take_off(plane)
    raise denied if check_weather(sky)
    plane.cleared
    @planes.delete(plane)
  end

  def check_weather(weather)
    weather.is_stormy?
  end
end
