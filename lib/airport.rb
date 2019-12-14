require_relative 'plane'

class Airport
  attr_accessor :capacity
  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end
end
