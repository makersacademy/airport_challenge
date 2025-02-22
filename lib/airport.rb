DEFAULT_CAPACITY = 20

class Airport
  attr_reader :id
  attr_reader :capacity
  attr_reader :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @id = 1
    @capacity = capacity
    @spaces = []
    @weather = Weather.new
  end

  def stormy?
    weather.stormy?
  end

  def spaces
    @spaces.size
  end

  def last_space
    @spaces[-1]
  end

  def land(plane)
    fail 'airport at it\'s max capacity' unless spaces < capacity
    fail 'stormy weather' unless stormy? != WEATHER_STATES[:stormy]
    plane.land(@id)
    @spaces << plane
  end

  def take_off
    fail 'no plane available' unless spaces.positive?
    fail 'stormy weather' unless stormy? != WEATHER_STATES[:stormy]
    plane = @spaces.pop
    plane.take_off(id)
  end
end
