class Weather

  def stormy?
  weather_types == :stormy
  end

  def weather_types
    [:stormy, :sunny, :sunny, :sunny].sample
  end
end
