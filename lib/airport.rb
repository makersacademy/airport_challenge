class Airport
  attr_reader :hanger, :capacity 

  def initialize(capacity = 1)
    @hanger = []
    @capacity = capacity
  end

  def land(plane)
    raise "Can't land, airport is full." if @hanger.length > 0
    update_grounded_status(plane) 
    @hanger << plane
  end

  def take_off(plane)
    update_grounded_status(plane) 
    @hanger.delete(plane)
  end

  def update_grounded_status(plane) 
    plane.grounded = !@grounded
  end

end
