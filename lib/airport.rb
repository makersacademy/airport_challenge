require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 5

  attr_reader :capacity, :today_weather

  def initialize (capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    # @today_weather = Weather.weather_stormy
  end

  def today_weather
    today_weather = Weather.weather_stormy
  end

  def clear_to_land(plane)
    raise 'Airport at Capacity' if @planes.count >= @capacity
    raise 'Stormy!' if today_weather == 'stormy'
    plane.land
    @planes << plane
  end

  def clear_to_take_off(plane)
    raise 'Stormy!' if today_weather == 'stormy'
    plane = @planes.pop
    plane.take_off
  end

  def planes
    @planes
  end

  def count_planes
    @planes.count
  end

  def capacity
  @capacity
  end


end
