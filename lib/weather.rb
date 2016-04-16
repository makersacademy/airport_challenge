class Weather

  attr_reader :weather

  def initialize
    @weather = 0
  end

  def stormy?
    @weather >= 7
  end

  def weather_generator
    @weather += rand(11)
    self
  end

end
