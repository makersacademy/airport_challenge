require './lib/plane.rb'
require './lib/weather.rb'

class Airport
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  attr_reader :planes, :capacity, :weather

  def land(plane)
    prevent_if_stormy
    raise "Plane not airborne" unless plane.airborne
    raise "Cannot land, airport full" if full?

    plane_landed(plane)
    planes << plane
  end

  def take_off(plane)
    prevent_if_stormy
    raise "Plane already airborne" if plane.airborne
    raise "Plane not at this airport" unless at_airport?(plane)

    plane_took_off(plane)
    planes.delete(plane)
  end

  private

  def prevent_if_stormy
    raise "Stormy weather prevents take off and landing" if weather.stormy?
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

  def at_airport?(plane)
    planes.include?(plane)
  end
end
