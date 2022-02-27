class Airport
  attr_reader :planes
  attr_reader :capacity
  
  def initialize(capacity=20)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Airport is full" if @planes.count >= 1
    @planes << plane
  end

  def take_off(plane)
    raise 'Airport is empty' if @planes.empty?
    @planes.pop
  end

end