class Airport
  DEFAULT_CAPACITY = 8


  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end


  def instruct_to_land(plane)
    raise "Airport is full" if full?
    raise "Plane already landed" if @planes.include?(plane)
    @planes << plane
  end


  def instruct_to_takeoff(plane)
    raise "Plane already took off" unless @planes.include?(plane)
    @planes.delete(plane)
  end

  def full?
    @planes.count == capacity
  end

end
