require_relative "weather"

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end
end