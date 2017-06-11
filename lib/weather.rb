class Weather

attr_reader :forecast

  def initialize
    @forecast = change_weather
  end

  def stormy?
    @forecast == :stormy
  end

  def change_weather
    forecast = [:stormy, :sunny, :sunny, :sunny]
    forecast.sample
  end

end
