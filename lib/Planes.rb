class Plane

end


class Airport
  attr_reader :plane, :capacity, :weather_today
  MAX_AIRPORT_CAPACITY = 20
  WEATHER = [1, 2]
  def initialize(capacity = MAX_AIRPORT_CAPACITY, weather = WEATHER.sample)
    @weather_today = weather
    @capacity = capacity
    @plane = []
  end

  def land(plane)
    if @weather_today == 1
      if @plane.length >= @capacity
        fail 'Airport is full'
      else
        @plane << plane
      end
    elsif @weather_today == 2 
      fail 'It is too risky to land'
    end
  end
  
  def takeoff
    if @weather_today == 1
      if @plane.length < 1
        fail 'There are no planes ready for takeoff'
      else
        @plane.pop
      end
    elsif @weather_today == 2
      fail 'It is too risky to takeoff'
    end
  end

end