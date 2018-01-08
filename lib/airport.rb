require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 1

  attr_reader :planes

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail "Cannot land as airport is full" if full?
    fail "Cannot land due to stormy weather" if @weather.stormy?
    @planes << plane
    @planes.last
  end

  def full?
    @planes.length >= @capacity
  end

  def take_off(plane)
    fail "Airport is empty." if @planes.empty?
    fail "Cannot take off due to stormy weather" if @weather.stormy?
    if @planes.include? plane
      @planes.delete(plane)
      @planes
    else
      fail "This plane is not at the airport"
    end
  end

  def has_plane(plane)
    return @planes if @planes.include? plane
  end
end
