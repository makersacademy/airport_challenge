class Airport
  DEFUALT_CAPACITY = 20

  attr_reader :planes, :capacity

  def initialize(capacity=DEFUALT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport full." if full?
    @planes << plane        
  end

  def take_off(plane)
    return_plane = @planes.detect { |landed_plane| landed_plane == plane }
    @planes.delete(plane)
    return_plane
  end

  private

  def full?
    @planes.length >= @capacity
  end
end