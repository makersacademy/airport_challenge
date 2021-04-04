class Weather
  def weather_condition
    ["sunny", "sunny", ["stormy", "sunny"].sample, "sunny"].sample
  end

  def meteo
    @meteo = weather_condition
  end
end
