class Weather
  FORECAST = ["stormy", "sunny", "sunny"]

  def stormy?
    forecast_sample == "stormy"
  end

  private

  def forecast_sample
    FORECAST.sample
  end
end
