class Airport
  attr_accessor :landed_planes, :capacity
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def stormy?
    rand >= 0.9 ? true : false
  end
end
