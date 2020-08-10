require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "Airport full" if full?

    raise "Plane not flying" unless plane.flying

    #raise "Too stormy to land" if stormy?

    plane.landed
    @planes << plane
  end

  def take_off(plane)
    raise "Plane not in airport" unless at_airport(plane)

    #raise "Too stormy to take off" if stormy?

    plane.is_flying
    @planes.pop
  end

  attr_reader :planes, :capacity, :weather

  private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def at_airport(plane)
    @planes.include?(plane)
  end

  def stormy?
    @weather.stormy?
  end

end
