class Weather
  CONDITIONS = [:clear, :clear, :clear, :clear, :clear, :stormy]

  def weather_randomised
    CONDITIONS.sample
  end

  def stormy?
    weather_randomised == :stormy
  end

end
