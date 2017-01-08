class Airport

  CAPACITY = 10
  def initialize(capacity = CAPACITY)
    @planes = []
    @capacity = capacity
  end

  attr_accessor :planes
  attr_accessor :capacity

  def land(plane)
    airport_full?
    @planes << plane
  end

  def takeoff(plane)
    plane_in_airport?(plane)
    @planes.delete(plane)
  end

  private
  def airport_full?
    message = "The airport is full"
    raise message if @planes.length == @capacity
  end
  def plane_in_airport?(plane)
    message = "There is no such plane in the airport"
    raise message if !@planes.include?(plane)
  end
end
