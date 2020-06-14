class Airport

  DEFAULT_CAPACITY = 1

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail 'This airport is full' if full?
    raise 'Plane cant land due to stormy weather' if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise 'Plane cant take off due to stormy weather' if stormy?
    @planes.pop
  end

  def stormy?(stormy)
    fail 'Its too stormy.' if weather == :stormy
  end

  private

  RANDOM_WEATHER = [:stormy, :clear, :clear, :clear]

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def weather
    RANDOM_WEATHER.sample
  end


end