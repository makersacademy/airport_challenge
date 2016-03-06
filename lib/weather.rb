class Weather
  def stormy?
    condition == :stormy
  end

  private

  WEATHER_CONDITIONS = [:stormy, :sunny, :a_bit_shit, :clear].freeze

  def condition
    WEATHER_CONDITIONS.sample
  end
end
