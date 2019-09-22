class Weather
  attr_reader :storm

  def check_weather
    @storm = weather
  end

  def weather
    rand(10) > 7
  end
end
