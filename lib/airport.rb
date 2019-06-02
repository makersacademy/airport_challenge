require './lib/plane.rb'

class Airport
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  attr_reader :planes, :capacity

  def land(plane)
    raise "Plane not airborne" if plane.airborne == false
    stormy?
    raise "Cannot land, airport full" if full?

    plane_landed(plane)
    planes << plane
  end

  def take_off(plane)
    stormy?

    plane_took_off(plane)
    planes.delete(plane)
  end

  private

  def weather
    # 1 in 7 chance of stormy weather
    rand(7).zero? ? "stormy" : "sunny"
  end

  def stormy?
    raise "Stormy weather prevents take off and landing" if weather == "stormy"
  end

  def full?
    planes.length >= @capacity
  end

  def plane_landed(plane)
    plane.airborne = false
  end

  def plane_took_off(plane)
    plane.airborne = true
  end
end
