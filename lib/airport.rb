require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 40
  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end
end
