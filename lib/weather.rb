class Weather
  def stormy?
    current_weather == :stormy
  end

  private
  def current_weather
    [:fine, :downpours, :overcast, :light_showers, :stormy].sample
  end
end
