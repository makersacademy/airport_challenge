class Weather

  def initialize
    @weather = set_weather
  end

  def report_weather
    @weather
  end

  def stormy?
    @weather == :stormy
  end

  private

  WEATHER_CONDITIONS = [:stormy, :sunny, :sunny, :sunny].freeze

  def set_weather
    WEATHER_CONDITIONS.sample
  end
end

