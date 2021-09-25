class Airport
  attr_reader :capacity
  
  def initialize(capacity = 50)
    @capacity = capacity
    @terminal = []
  end

  def land(plane)
    raise 'airport is full' if @terminal.count >= capacity
    @terminal << plane
  end

  def take_off(plane)
    # @plane = Plane
    # plane.departed = true
  end
  # def permission_to_land
  # end 
end 
