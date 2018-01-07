require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def dispatch(plane)
    raise 'Cannot dispatch plane not present in airport' unless has?(plane)
    @planes.delete(plane)
  end

  def receive(plane)
    raise 'Cannot receive plane already present in airport' if has?(plane)
    raise 'Insufficient capacity to receive plane' if full?
    @planes << plane
  end

  def full?
    @planes.count >= @capacity
  end

  def has?(plane)
    @planes.include?(plane)
  end
end
