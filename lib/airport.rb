require_relative 'plane'

class Airport
  attr_reader :landed_planes, :capacity

  DEFAULT_CAPACITY = 40

  def initialize(capacity=DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end



end
