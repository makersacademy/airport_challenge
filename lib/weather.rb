class Weather

  def stormy?
    weather_report == :stormy
  end

  private

  def weather_report
    [:stormy, :clear, :cloudy, :rain].sample
  end

end
