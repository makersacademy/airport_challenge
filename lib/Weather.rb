class Weather
  attr_reader :stormy

  def stormy?
    weather_randomiser == :stormy
  end

  private

  WEATHER_POSSIBILITIES = [:good, :good, :good, :stormy, :good, :good]

  def weather_randomiser
    WEATHER_POSSIBILITIES.sample
  end
end
