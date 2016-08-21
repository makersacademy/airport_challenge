class Weather

  attr_reader :stormy

  def stormy?
    @stormy
  end

  def rand
  rand(1..10)
  end

  def weather_generator
    rand == 1 ? @stormy = true : @stormy = false
  end
end
