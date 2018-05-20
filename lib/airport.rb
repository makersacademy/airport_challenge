require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail 'Airport is full' if full?
    fail 'Plane has already landed' if plane.landed?
    fail 'Cannot land, weather is stormy' if stormy
    plane.make_land
    @planes << plane
  end

  def take_off(plane)
    fail 'Plane is not at airport' unless @planes.include?(plane)
    fail 'Cannot take off, weather is stormy' if stormy
    plane.make_take_off
    @planes.delete(plane)
  end

  def stormy
    weather.stormy?
  end

  private
  def full?
    planes.size >= @capacity
  end

end
