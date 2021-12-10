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
    if rand(10) <= 4
      @sunny = false
    else
      @sunny = true
    end
    # rand(10) <= 4 ? @sunny = false : @sunny = true
  end
end
