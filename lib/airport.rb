class Airport
attr_reader :airport

DEFAULT_CAPACITY = 1
  def initialize(capacity = 1)
    @capacity = capacity
    @airport = []
  end

  def land(plane)
    @airport << plane
  end

end
