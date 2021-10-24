class WeatherReport

  attr_reader :weather

  def initialize
    @weather = rand > 0.8 ? :stormy : :sunny
  end

end
