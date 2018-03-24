class Airport
  attr_reader :planes, :weather
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def stormy?
    weather.stormy?
  end

  def full?
    planes.length >= capacity
  end
end
