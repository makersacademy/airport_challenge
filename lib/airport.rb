require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane, weather = Weather.new)
    airport_full?
    check_weather(weather)
    @planes << plane
    self
  end

  def take_off_plane(plane, weather = Weather.new)
    check_weather(weather)
    @planes.delete(plane)
    self
  end

  def airport_full?
    fail "can't land as airport is full" if @planes.length == @capacity
  end

  def check_weather(weather)
    fail "can't do that due to storms" if weather.condition == "stormy"
  end

end
