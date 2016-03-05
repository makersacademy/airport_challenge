class Weather
  def stormy?
    condition == :stormy
  end

  private

  WEATHER_CONDITIONS = [:stormy, :fine, :fine, :fine].freeze

  def condition
    WEATHER_CONDITIONS.sample
  end
end
