require_relative 'weather'
require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 100

  attr_accessor :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    fail "Airport full" if full?
    fail "Bad weather, cannot land" if stormy?

    planes << plane
  end

  def take_off(plane)
    fail "Bad weather, cannot take off" if stormy?
    fail "Plane not in airport" unless planes.include?(plane)

    planes.delete(plane)
  end

  private

  attr_reader :planes

  def full?
    planes.count >= capacity
  end

  def stormy?
    weather.stormy?
  end

end
