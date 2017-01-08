class Airport
attr_accessor :planes

  def initialize(capacity=1)
    @planes = []
    @capacity = capacity
  end

  def recieve_plane(plane)
    if full?
      fail 'airport full'
    else
      @planes.push(plane)
      return @planes[-1]
    end
  end

  def takeoff_plane(plane)
    @planes.delete(plane)
    return @planes
  end
end

def full?
  @planes.length >= @capacity
end
