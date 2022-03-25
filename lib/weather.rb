class Weather
  attr_reader :random_number

  def weather_predictions
    predictions = [:sunny, :sunny, :sunny, :sunny, :sunny, :sunny, :sunny, :sunny, :stormy, :stormy]
  end

  def random_weather
    predictions[rand(1..10)]
  end

  def stormy?
    random_weather == :stormy
  end
  def sunny?
    random_weather == :sunny
  end
end