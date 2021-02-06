class Plane

end


class Airport
  attr_reader :plane, :capacity, :weather_today
  MAX_AIRPORT_CAPACITY = 20
  WEATHER = ["clear", "stormy"]
  def initialize(capacity = MAX_AIRPORT_CAPACITY, weather = WEATHER.sample)
    @weather_today = weather
    @capacity = capacity
    @plane = []
  end

  def land(plane)
    if @plane.length >= @capacity
      fail 'Airport is full'
    else
      @plane << plane
    end
  end
  
  def takeoff
    if @plane.length < 1
      fail 'There are no planes ready for takeoff'
    else
      @plane.pop
    end
  end

end