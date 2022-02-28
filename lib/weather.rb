class Weather
  def stormy?
    randomise_weather == :stormy
  end

  private

  POSSIBLE_WEATHER = [:sunny, :sunny, :sunny, :stormy]

  def randomise_weather
    POSSIBLE_WEATHER.sample
  end
end