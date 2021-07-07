class Airport
  attr_reader :plane_capacity, :max_capacity

  DEFAULT_CAPACITY = 10

  def initialize(max_capacity = DEFAULT_CAPACITY)
    @max_capacity = max_capacity
    @plane_capacity = []
  end
end
