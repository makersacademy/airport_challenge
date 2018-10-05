class Airport
  attr_accessor :capacity, :weather, :planes
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @weather = random_weather
    @planes = []
  end

  def full?
    @planes.length >= @capacity
  end

  private
  def random_weather
    if rand(10).zero?
      "stormy"
    else
      "sunny"
    end
  end

end
