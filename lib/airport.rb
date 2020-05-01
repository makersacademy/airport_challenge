require './lib/plane'
require './lib/weather'

class Airport
  attr_reader :capacity, :planes, :weather
  DEFAULT_CAP = 5

  def initialize(capacity = DEFAULT_CAP, weather = Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def land(plane)

    fail "Airport is full" if full?

    fail "Weather is stormy, don't land!" if @weather.stormy?

    planes << plane
  end

  def take_off

    fail "Weather is stormy, don't take off!" if @weather.stormy?

    fail "No planes in airport" if empty?

    planes.pop
  end

  private

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end
end
