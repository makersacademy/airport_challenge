require_relative 'plane'
require_relative 'transit'

class Airport

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_at_rest = []
    @capacity = capacity
  end

  attr_accessor :planes_at_rest, :capacity

  def land(plane, transit)
    raise "Too stormy for landing" if transit.stormy?
    raise "The airport is currently full" if @capacity == planes_at_rest.count
    @planes_at_rest << plane
  end

  def take_off(plane, transit)
    raise "Too stormy for take off" if transit.stormy?
    @planes_at_rest.delete(plane)
    transit.planes_in_transit.push(plane)
  end
end
