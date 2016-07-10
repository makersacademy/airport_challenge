class Airport

  attr_reader :planes
  attr_accessor :weather
  attr_accessor :capacity

  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = WeatherState.new.weather
  end

  def full?
    @planes.count >= capacity
  end

end
