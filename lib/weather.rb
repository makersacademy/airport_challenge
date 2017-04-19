class Weather

  attr_reader :stormy

  def stormy?
    @stormy = true
  end

  def weather_generator
    rand(1..10) == 1 ? @stormy = true : @stormy = false
  end
end
