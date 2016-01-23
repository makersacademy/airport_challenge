
require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 25

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def at_capacity?
    @planes.count >= capacity
  end

end
