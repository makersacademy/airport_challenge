class Weather
  OUTLOOKS = [:stormy, :cloudy, :sunny, :rainy]
  def forecast
    OUTLOOKS.sample
  end
  def stormy?
    forecast == :stormy
  end
end
