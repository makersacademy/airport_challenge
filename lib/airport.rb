require_relative 'plane'
class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :capacity
  def initialize (capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @today_weather
    #@planes << Plane.new("landed")
  end

  def clear_to_land(plane)
    if @planes.count >= @capacity
    raise 'Airport at Capacity'
  elsif self.weather_conditions == 'stormy'
    raise 'Stormy!'
    else
    plane.land
    @planes << plane
    end
  end


  def clear_to_take_off(plane)

    plane = @planes.pop
    plane.take_off
  end

  def planes
    @planes
  end

  def count_planes
    @planes.count
  end

  def weather_conditions
  @today_weather = Weather.new.stormy
  end


end
