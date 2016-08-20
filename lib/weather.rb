class Weather

  attr_reader :stormy, :sunny

  def initialize
    @sunny = true
    @stormy = false
  end

  def random_weather
    x = rand(1..100)
    is_stormy if x > 90
  end

  def is_stormy
    @stormy = true
  end

  def is_sunny
    @sunny = true
  end

end
