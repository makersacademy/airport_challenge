require 'weather.rb'

class Airport
  attr_reader :planes, :sky, :denied

  def initialize
    @planes = []
    @sky = Weather.new
    @denied = 'Permission denied, the weather is too dangerous.'
  end

  def planes
    @planes.dup
  end

  def land_plane(plane)
    raise denied if check_weather(sky)
    @planes << plane
  end

  def clear_plane_for_take_off
    raise denied if check_weather(sky)
    @planes.pop
  end

  def check_weather(weather)
    weather.is_stormy?
  end
end
