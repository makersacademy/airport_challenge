class Weather

  STORMY_WEATHER_THRESHOLD = 2

  def initialize(weather=rand(10))
    @weather = weather
  end

  def stormy?
    if @weather < STORMY_WEATHER_THRESHOLD
      @weather = true
    else
      @weather = false
    end
  end

end
