class Weather
  attr_reader :current_forecast

  def initialize
    weather_gen
  end

  def forecast
    @current_forecast
  end

  private

  def weather_gen
    @current_forecast = [:sunny, :stormy].sample
  end
end
