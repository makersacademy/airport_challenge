module Weather
  def weather_rand
    rand(100)
  end

  def storm?
    weather_rand > 80
  end
end
