class Airport

  DEFAULT_CAPACITY = 1

  def initialize (capacity=DEFAULT_CAPACITY)
    @planes = Array.new
    @capacity = capacity
  end

  def plane_has_landed( plane)
    raise "Airport is full" if full?
    @planes.push plane
  end

  def plane_has_taken_off( plane)
    @planes.delete(plane)
    return plane
  end

  private

  def full?
    @planes.length >= @capacity
  end
end