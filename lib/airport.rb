require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 50
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Plane already landed' if plane_landed?(plane)
    fail 'Airport full' if full?
    fail 'Weather stormy' if weather_stormy?

    @planes << plane
    plane.landed
    true
  end

  def take_off(plane)
    fail 'Plane not in airport' unless @planes.include? plane 
    fail 'Weather stormy' if weather_stormy?

    true
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def weather_stormy?
    Weather.new.stormy?
  end

  def plane_landed?(plane)
    plane.landed?
  end

end
