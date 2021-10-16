require_relative '../lib/controller'
require_relative '../lib/weather'
DEFAULT_CAPACITY = 20

class Airport
  def initialize(capacity = DEFAULT_CAPACITY)
    @id = 1
    @controller = Controller.new
    @capacity = capacity
    @spaces = []
    @weather = Weather.new
  end

  attr_reader :id

  attr_reader :controller

  attr_reader :capacity

  def spaces
    @spaces.size
  end

  def land(plane)
    fail 'airport at it\'s max capacity' unless @spaces.size < capacity
    fail 'stormy weather' unless @weather.state != WEATHER_STATES[:stormy]
    @spaces << plane
  end

  def last_space
    @spaces[-1]
  end

end
