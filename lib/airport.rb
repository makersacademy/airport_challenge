require_relative 'weather'
require_relative 'plane'

class Airport
  CAPACITY = 3
  attr_accessor :planes, :weather, :capacity
  def initialize
    @planes = []
    @capacity = CAPACITY
    @weather = weather
  end

  def land(plane, weather)
    fail 'plane already landed' if @planes.include?(plane)

    fail 'airport full' if full?

    fail 'cannot land while stormy' if weather.stormy?

    plane.flying = false
    @planes << plane
  end

  def take_off(plane, weather)
    fail 'plane already flying' if plane.flying

    fail 'plane not in airport' unless @planes.include?(plane)

    fail 'cannot take off while stormy' if weather.stormy?

    plane.flying = true
    @planes.pop
  end

  private

  def full?
    planes.count == @capacity
  end
end
