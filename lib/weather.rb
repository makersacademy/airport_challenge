class Weather
  def stormy?
    condition == :stormy
  end

  private

  WEATHER_CONDITIONS = [:stormy, :sunny, :kind_of_shitty_but_ok, :fine].freeze

  def condition
    WEATHER_CONDITIONS.sample
  end
end
