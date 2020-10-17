class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def detect_weather
    num = rand(10)
    if num > 6
      :stormy
    else
      :sunny
    end
  end
end
