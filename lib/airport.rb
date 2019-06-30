class Airport
  DEFAULT_CAPACITY = 150
  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
  end
end
