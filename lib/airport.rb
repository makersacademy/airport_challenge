class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    error_message_1 = "Airport is full, no landing allowed"
    raise error_message_1 if full?
    error_message_2 = "Plane already landed cannot land again"
    raise error_message_2 if @planes.include?(plane)
    @planes << plane
  end

  def takeoff(plane)
    error_message = "Plane not in the airport cannot takeoff"
    raise error_message unless @planes.include?(plane)
    @planes.delete(plane)
  end

  def full?

  end
end
