class Weather

  def stormy?
    @stormy
  end

  def good_weather
    @stormy = false
  end

  def bad_weather
    @stormy = true
  end

end
