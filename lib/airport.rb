class Airport
  attr_reader :planes, :weather
  DEFAULT_CAPACITY = 5
  STORM_CHANCE = 0.1

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @weather = random_weather
    @planes = []
  end

  def full?
    planes.length >= @capacity
  end

  private
  def random_weather
    rand(1 / STORM_CHANCE).zero? ? "stormy" : "sunny"
  end
end
