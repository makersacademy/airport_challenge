class Weather

  attr_reader :stormy, :sunny

  def initialize
    @sunny = true
    @stormy = false
  end

  def random_weather
    x = rand(1..100)
    stormy? if x > 90
  end

  def stormy?
    @stormy = true
  end

  def sunny?
    @sunny = true
  end

end
