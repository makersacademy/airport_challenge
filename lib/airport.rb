DEFAULT_CAPACITY = 20
WEATHER_STATES = { stormy: true, not_stormy: false }.freeze
STORMY_ODDS = [WEATHER_STATES[:not_stormy], WEATHER_STATES[:not_stormy],
               WEATHER_STATES[:not_stormy], WEATHER_STATES[:stormy]].freeze

class Airport
  attr_reader :id
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @id = 1
    @capacity = capacity
    @spaces = []
  end

  private def random_weather
    STORMY_ODDS.sample
  end

  def spaces
    @spaces.size
  end

  def last_space
    @spaces[-1]
  end

  def stormy?
    random_weather == WEATHER_STATES[:stormy]
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
