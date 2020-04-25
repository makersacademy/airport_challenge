require './lib/plane'
require './lib/weather'

class Airport
  DEFAULT_CAP = 5
  attr_reader :capacity, :planes, :weather

  def initialize(capacity = DEFAULT_CAP)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)

    fail "Weather is stormy, don't land!" if @weather.stormy?

    fail "Airport is full" if full?

    planes << plane
  end

  def take_off

    fail "No planes in airport" if empty?

    #fail "Weather is stormy, don't take off!" if @weather.stormy?

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
