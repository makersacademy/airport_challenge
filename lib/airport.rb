class Airport

  def initialize(capacity)
    @capacity = (capacity)
    @planes = []
  end

  def landing(plane)
    raise 'No free spots to land - Aiport Full' if @planes.count == @capacity
    @planes.push(plane)
  end

  def take_off(plane)
    @planes.remove(plane)
  end

end