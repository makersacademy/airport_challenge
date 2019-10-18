class Airport
  attr_reader :plane_capacity, :max_capacity

  def initialize(max_capacity)
    @max_capacity = max_capacity
    @plane_capacity = []
  end
end
