require 'weather'

class Airport
  attr_reader :planes
  attr_reader :capacity
  attr_reader :weather

  DEFAULT_CAPACITY = 30

  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land plane
    fail("No space to land at this airport!") if full?
    fail("Weather conditions not safe for landing!") if @weather.is_stormy?
    plane.land_at(self)
    @planes << plane
  end

  def take_off plane
    fail("Plane is not at this airport!") unless @planes.include?(plane)
    fail("Weather conditions not safe for take off!") if @weather.is_stormy?
    plane.take_off
    @planes -= [plane]
  end

  private

  def full?
    @planes.length >= @capacity
  end

end
