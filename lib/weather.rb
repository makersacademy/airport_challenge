class Weather

  attr_reader :weather

  def initialize
    @weather = (rand(1..10) == 10 ? :stormy : :sunny)
  end

  def weather_check
    @weather == :sunny
  end

end
