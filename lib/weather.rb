class Weather

  attr_reader :weather

  def initialize
    @weather = set_weather
  end

  private
  def set_weather
    chance < 2 ? :stormy : :fine
  end

  def chance
    rand(9)
  end

end
