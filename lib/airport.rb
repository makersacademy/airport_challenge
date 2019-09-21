class Airport

  attr_accessor :planes, :weather, :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = ["sunny", "stormy"].sample
    @capacity = capacity
  end

  def full?
    planes.count >= capacity
  end

end
