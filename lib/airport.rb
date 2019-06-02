require './lib/plane.rb'

class Airport
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  attr_reader :planes, :capacity

  def weather
    # 1 in 7 chance of stormy weather
    rand(7).zero? ? "stormy" : "sunny"
  end

  def land(plane)
    raise "Stormy weather prevents landing" if stormy?
    raise "Cannot land, airport full" if full?

    planes << plane
    plane.airborne = false
  end

  def take_off(plane)
    raise "Stormy weather prevents take off" if stormy?

    planes.delete(plane)
    plane.airborne = true
  end

  private

  def stormy?
    weather == "stormy"
  end

  def full?
    planes.length >= @capacity
  end
end
