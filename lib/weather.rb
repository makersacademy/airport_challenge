class Weather

  WEATHER = [:good, :stormy, :good, :good, :stormy, :good, :good]

  def check_weather
    @weather = WEATHER[rand(7)]
  end

  def stormy?
    check_weather == :stormy
  end

end
