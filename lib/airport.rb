require './lib/plane'
require './lib/weather'

class Airport
  DEFAULT_CAP = 5
  attr_reader :capacity, :planes, :weather
#  attr_reader :planes
#  attr_reader :weather

  def initialize(capacity = DEFAULT_CAP)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail "Airport is full" if full?

    fail "Weather is stormy, don't land!" if weather == 2

    planes << plane
  end

  def take_off
    fail "No planes in airport" if empty?

    fail "Weather is stormy, don't take off!" if weather == 2

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
