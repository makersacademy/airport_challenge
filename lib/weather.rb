class Weather

  def stormy?
    current_forecast == :stormy
  end

  private

  FORECASTS = [:stormy, :sunny, :sunny, :sunny]

  def current_forecast
    FORECASTS.sample
  end

end
