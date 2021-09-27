class Airport
  attr_reader :capacity, :terminal
  STORMY_TAKEOFF_ERROR = "Cannot take off - stormy weather"
  STORMY_LAND_ERROR = "Cannot land - stormy weather"
  FULL_ERROR = 'Cannot land - airport is full'
  
  def initialize(capacity = 50)
    @capacity = capacity
    @terminal = []
  end

  def land(plane)
    raise FULL_ERROR if @terminal.count >= capacity
    raise STORMY_LAND_ERROR if stormy?
    @terminal << plane
  end

  def take_off(plane)
    raise STORMY_TAKEOFF_ERROR if stormy?
    @terminal.pop
  end
  
  def stormy?
    rand(1..5) > 4
  end 
end 