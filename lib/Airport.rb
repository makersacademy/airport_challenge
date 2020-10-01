class Airport
  CAPACITY = 10
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Airport is full." if self.full?
    @planes.push(plane)
  end

  def takeoff(plane)
    todays_sky = Sky.new
    #raise "The sky is too stormy to fly." if todays_sky.stormy?
    @planes.delete(plane)
  end

  def full?
    @planes.length == CAPACITY
  end
end
