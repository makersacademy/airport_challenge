require_relative "plane"
require_relative "weather"

class Airport

  attr_reader :capacity
  DEFAULT_CAPACITY = 50

  def initialize(**opts)
    @weather = opts[:weather] || Weather.new
    @capacity = opts[:capacity] || DEFAULT_CAPACITY
    @planes = []
  end

  def land(plane)
    fail "Landing prevented due to stormy weather" if weather.stormy?
    fail "Airport reached its capacity" if full?
    plane.land_at(self)
    planes << plane
  end

  def take_off(plane)
    fail "Take-off prevented due to stormy weather" if weather.stormy?
    plane.depart_from(self)
    planes.delete plane
  end

  private

  attr_reader :planes, :weather

  def full?
    planes.count >= capacity
  end

end
