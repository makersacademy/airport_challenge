# responsible for the weather conditions
class Weather

  def stormy?
    random_forecast == :stormy
  end

  private

  FORECAST = [:stormy, :sunny, :stormy, :sunny, :sunny].freeze

  def random_forecast
    FORECAST.sample
  end
end