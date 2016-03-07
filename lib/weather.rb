class Weather

  def stormy?
    weather == :stormy
  end

  private

  def weather
    [:stormy, :clear, :cloudy, :rain].sample
  end

end
