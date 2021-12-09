class Weather

  attr_reader :sunny

  def initialize
    @sunny = true
  end

  def sunny?
    get_weather
    sunny
  end

  def get_weather
    rand(10) <= 4 ? @sunny = false : @sunny = true
  end
end
