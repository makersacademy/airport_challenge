class Weather

  def initialize
    set_weather
  end

  def set_weather
    rand(100) < 20 ? @weather = :stormy : @weather = :fine
  end

  def weather_report
    @weather
  end

end
