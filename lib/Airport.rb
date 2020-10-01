class Airport
  CAPACITY = 10
  attr_reader :planes, :sky

  def initialize
    @planes = []
    @sky = Sky.new
  end

  def land(plane)
    raise "Airport is full." if self.full?
    @planes.push(plane)
  end

  def takeoff(plane)
    raise "The sky is too stormy to fly." if @sky.stormy?
    @planes.delete(plane)
  end

  def full?
    @planes.length == CAPACITY
  end
end
