class Airport
  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 10
  WEATHER_SCALE = 10

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
    @weather = rand(WEATHER_SCALE)
  end

  def full?
    return @planes.length >= DEFAULT_CAPACITY
  end

  def is_stormy?
    @weather < WEATHER_SCALE ? false : true
  end
end