class Airport
DEFAULT_CAPACITY = 25
attr_reader :capacity

  def initialize
    @capacity = DEFAULT_CAPACITY
    @hanger = []
  end
  def land(plane)
    @hanger << plane
  end

  def launch(plane)
    @hanger.delete(plane) 
  end

  def space_check
    @capacity - @hanger.length
  end

end
