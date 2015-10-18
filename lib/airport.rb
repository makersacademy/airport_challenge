class Airport
  DEFAULT_CAPACITY = 1

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = Array.new
    @capacity = capacity
  end

  def request_landing( plane)
    raise "Airport is full" if full?
    @planes.push plane
  end

  def request_take_off( plane)
    raise "Plane is not at airport" if !@planes.include?plane
    @planes.delete(plane)
  end

  private

  def full?
    @planes.length >= @capacity
  end
end