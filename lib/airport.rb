require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def dispatch(plane)
    raise 'Cannot dispatch plane not present in airport' unless has?(plane)
    raise 'Cannot dispatch in stormy weather' if adverse_conditions?
    @planes.delete(plane)
  end

  def receive(plane)
    raise 'Cannot receive plane already present in airport' if has?(plane)
    raise 'Insufficient capacity to receive plane' if full?
    raise 'Cannot receive in stormy weather' if adverse_conditions?
    @planes << plane
  end

  def full?
    @planes.length >= @capacity
  end

  def has?(plane)
    @planes.include?(plane)
  end

  private
  def adverse_conditions?
    Weather.new.stormy?
  end
end
