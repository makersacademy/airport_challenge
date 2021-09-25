class Airport
  attr_reader :capacity
  
  def initialize(capacity = 50)
    @capacity = capacity
  end

  def land(plane)
    raise 'airport is full' if @plane 
    @plane = plane
  end

  def take_off(plane)
    # @plane = Plane
    # plane.departed = true
  end
  # def permission_to_land
  # end 
end 
