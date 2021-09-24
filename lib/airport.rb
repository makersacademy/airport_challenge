class Airport
  attr_reader :landed_planes, :capacity

  def initialize(capacity = 10)
    @landed_planes = []
    @capacity = capacity
  end
end
