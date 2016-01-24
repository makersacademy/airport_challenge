module Weather

  def weather_options
    @weather.dup
  end

  def weather_status
    weather_options.sample
  end

  private

  def weather
    @weather = ["sunny","sunny","sunny","sunny","stormy",
               "sunny","sunny","stormy","sunny","sunny"]
  end

end
