class Airport
  attr_reader :hanger
  def initialize
    @hanger = []
  end

  def land(plane)
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
