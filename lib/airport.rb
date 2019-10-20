require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 1

attr_accessor :capacity
attr_accessor :stormy
attr_accessor :weather

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
    fail "Airport is empty" if empty?
    fail "Cannot take off in stormy weather" if @weather.stormy == true
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
