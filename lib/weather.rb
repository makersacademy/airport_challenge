class Weather
  def stormy_weather?
    storm_level > 80
  end

  def storm_level
    rand(1..100)
  end
end
