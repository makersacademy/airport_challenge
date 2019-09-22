require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def let_land(plane)
    raise 'Impossible, airport full' if full?
    raise 'Impossible, plane already landed' if plane.landed == true
    raise 'Impossible, the weather is stormy' if stormy_weather?

    plane.landed = true
    plane.flying = false
    planes << plane
  end

  def let_take_off(plane)
    raise 'Impossible, plane is already flying' if plane.flying == true
    raise 'Impossible, the weather is stormy' if stormy_weather?

    plane.flying = true
    plane.landed = false
    planes.delete(plane)
    planes
  end

  private

  def stormy_weather?
    weather = Weather.new
    return true if weather.status == "stormy"
  end

  def full?
    return true if planes.count >= capacity
  end

end
