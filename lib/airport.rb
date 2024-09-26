class Airport 

attr_reader :capacity, :planes
DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY) 
    @planes = []
    @capacity = capacity
  end 

  def land(plane)
    raise 'Cannot land the plane, the airport is full' if @planes.count >= @capacity
    raise 'The plane cannot land in this weather' if stormy?
    @planes << plane
  end 

  def take_off(plane)
     raise 'The place cannot take off in stormy weather' if stormy?
     @planes.delete(plane)
  end 

  def stormy?
    rand(1..100) > 75
  end
  
end

