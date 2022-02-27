class Airport
  attr_reader :planes
  attr_reader :capacity
  DEFAULT_CAPACITY = 20
  
  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Airport is full" if @planes.count >= capacity
    @planes << plane
  end

  def take_off(plane)
    raise 'Airport is empty' if @planes.empty?
    @planes.pop
  end

end