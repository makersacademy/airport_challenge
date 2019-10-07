class Airport
  def initialize
    @limit = 4
    @planes = []
  end

  def land(plane)
    fail 'Airport at capacity' if full?
    @planes.push(plane)
  end

  def take_off(plane)
    @planes.delete(plane)
    return @planes
  end

  def return_plane(num)
    plane = @planes[num]
    return plane
  end

  def full?
    @planes.count >= @limit
  end
end
