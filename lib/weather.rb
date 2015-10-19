module Weather
  def storm?
    weather_randomizer <= 1? true : false
  end

  def weather_randomizer
    rand(0..10)
  end
end
