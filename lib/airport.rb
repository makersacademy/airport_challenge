class Airport
  attr_reader :capacity
  attr_reader :runway

  def initialize(capacity = 3) 
    @runway = []
    @capacity = capacity
  end 

  def land_plane(flying_plane)
    if capacity == false 
      raise "Airport at capacity, cant land any more planes here!"
    else 
      @runway << flying_plane
    end
  end

  def takeoff_plane(takeoff_plane)
    @runway.delete(takeoff_plane)
  end

  def at_capacity
    @runway.count >= capacity ? true : false
  end
end
