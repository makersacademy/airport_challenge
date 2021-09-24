class Airport
  DEFAULT_CAPACITY = 10
  WEATHER_PROC = ->{rand(30) > 20}
  attr_reader :planes
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes =[]
  end

  def send(weather_test=WEATHER_PROC)
    if @planes.length > 0 && !(bad_weather?(weather_test))
      return @planes.pop()
    else
      return false
    end
  end

  def receive(plane,weather_test=WEATHER_PROC)
    if allow?(weather_test)
      @planes << plane
    end
  end

  def allow?(weather_test = WEATHER_PROC)
    if @planes.length < @capacity && !(bad_weather?(weather_test))
      return true
    else
      return false
    end
  end

  def bad_weather?(proc = WEATHER_PROC)
    weather = proc.call
    return (weather == true || weather == false) ? weather : false
  end
end