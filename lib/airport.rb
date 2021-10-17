require_relative '../lib/weather'
DEFAULT_CAPACITY = 20

class Airport
  attr_reader :id
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @id = 1
    @capacity = capacity
    @spaces = []
    @weather = Weather.new
  end

  def spaces
    @spaces.size
  end

  def land(plane)
    fail 'airport at it\'s max capacity' unless @spaces.size < capacity
    fail 'stormy weather' unless @weather.state != WEATHER_STATES[:stormy]
    plane.land(@id)
    @spaces << plane
  end

  def last_space
    @spaces[-1]
  end

  def update_weather(state)
    @weather.update_state(state)
  end

  def take_off
    fail 'no plane available' unless spaces.positive?
    fail 'stormy weather' unless @weather.state != WEATHER_STATES[:stormy]
    plane = @spaces.pop
    plane.take_off(id)
  end
end
