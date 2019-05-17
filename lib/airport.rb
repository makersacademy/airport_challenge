class Airport
  AIRPORT_AT_CAPACITY_ERROR = "The airport is full. Plane can not land."
  DEFAULT_CAPACITY = 20

  attr_reader :landed, :capacity

  def initialize
    @landed = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(flying_object)
    raise AIRPORT_AT_CAPACITY_ERROR if landed.count >= capacity

    landed.push(flying_object)
    flying_object
  end
end
