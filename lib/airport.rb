require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 70
  attr_reader :capacity
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport is at full capacity.' if full?
    @planes << plane
    'Plane has landed'
  end

  def take_off(_plane)
    @planes.pop
    'Plane has taken off'
  end

  private

  def full?
    @planes.count >= capacity
  end
end
