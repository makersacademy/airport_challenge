class Weather
  attr_reader :stormy

  def stormy?
    @stormy
  end

  def random_number
    rand(1..10)
  end

  def change_weather
  random_number == 1 ? @stormy = true : @stormy = false
  end

end
