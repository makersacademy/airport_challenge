require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :weather

  DEFAULT_CAPACTITY = 10

  def initialize
    @planes = []
    @weather = Weather.new
    @capacity = DEFAULT_CAPACTITY
  end

  def land(plane)
    raise 'Could not complete landing due to weather' if weather.stormy?
    raise 'Cannot land because airport is full' if full?
    plane.lands
    @planes << plane
  end

  def take_off
    raise 'Airport is empty!' if @planes.empty?
    raise 'Could not complete takeoff due to weather' if weather.stormy?
    @planes[-1].takes_off
    @planes.pop
  end

  private

  def full?
    @planes.size == @capacity
  end
end
