class Airport
  DEFAULT_CAPACITY = 10
  WEATHER_PROC = ->{rand(30) > 20}
  attr_reader :planes
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes =[]
  end

  def send(weather_test=WEATHER_PROC)
    (planes.length > 0 && !(bad_weather?(weather_test))) && planes.pop().takeoff
  end

  def receive(plane,weather_test=WEATHER_PROC)
    allow?(weather_test) && planes << plane
  end

  def allow?(weather_test = WEATHER_PROC)
    planes.length < @capacity && !(bad_weather?(weather_test))
  end

  def bad_weather?(proc = WEATHER_PROC)
    weather = proc.call
    return (weather == true || weather == false) && weather
  end
end
