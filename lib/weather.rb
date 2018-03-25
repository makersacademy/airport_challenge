class Weather
  attr_accessor :sunny

  def initialize
    @sunny = true
  end

  def sunny?
    @sunny
  end

  def stormy
    @sunny = false
  end
end


class FakeSunnyWeather
  def sunny?
    true
  end
end

class FakeStormyWeather
  def sunny?
    false
  end
end
