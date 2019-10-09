class Airport

  attr_reader :planes

  def initialize
    @limit = 4
    @planes = []
  end

  def land(plane)
    fail 'Airport at capacity' if full?
    planes.push(plane)
  end

  def take_off(plane)
    planes.delete(plane)
    return planes
  end

  private

  def full?
    planes.count >= @limit
  end
end
