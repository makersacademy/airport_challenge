class WeatherReport

  attr_reader :weather

  def initialize
    @weather = set_weather
  end

  private

  def set_weather
    rand > 0.8 ? :stormy : :sunny
  end

end
