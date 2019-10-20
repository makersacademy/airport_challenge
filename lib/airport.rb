require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 1

attr_accessor :capacity
attr_accessor :stormy

  def initialize(weather: Weather.new)
    @planes = []
    @capacity = DEFAULT_CAPACITY
    @weather = weather
  end

  def land(plane)
    fail "Airport is full" if full?
    @planes << plane
  end

  def takeoff
    fail "Cannot take off in stormy weather" if @weather.stormy == true
    fail "Airport is empty" if empty?
    @planes.pop
  end

  def report
    return @planes
  end

  private

  attr_reader :planes

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end

end
