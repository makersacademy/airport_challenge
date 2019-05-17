class Airport
  AIRPORT_AT_CAPACITY = "The airport is full. You can not land."
  DEFAULT_CAPACITY = 20

  attr_reader :landed

  def initialize
    @landed = []
  end

  def land(flying_object)
    raise AIRPORT_AT_CAPACITY if landed.count >= DEFAULT_CAPACITY

    landed.push(flying_object)
    flying_object
  end
end
