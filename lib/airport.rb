require_relative 'plane'
require_relative 'weather'

class Airport

include Weather

  DEFAULT_CAPACITY = 15

  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport full" if full?
    fail "Adverse weather conditions" if stormy?
    fail "Plane grounded" unless plane.airbourne

    @planes << plane
  end

  def take_off(_plane)
    fail "Adverse weather conditions" if stormy?

    @planes.pop
  end

  private

  def full?
    @planes.size >= capacity
  end

end
