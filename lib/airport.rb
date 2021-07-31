class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "There is no space at this airport" if @planes.count >= DEFAULT_CAPACITY
    
    @planes << plane
  end

end
