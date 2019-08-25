class WeatherStation
  WEATHERS = [:sunny, :stormy].freeze

  def weather
    WEATHERS.sample
  end
end