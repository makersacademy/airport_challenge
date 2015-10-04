require_relative 'plane'
require_relative 'weather'

class Airport

  include Weather

  DEFAULT_CAPACITY = 5

  attr_reader :capacity, :now_weather

  def initialize (capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def now_weather
    if weather_stormy?
      "stormy"
    else
      "sunny"
    end
  end

  def clear_to_land(plane)
    raise 'Airport at Capacity' if @planes.count >= @capacity
    raise 'Stormy!' if now_weather == 'stormy'
    plane.land
    @planes << plane
  end

  def clear_to_take_off(plane)
    raise 'Stormy!' if now_weather == 'stormy'
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
