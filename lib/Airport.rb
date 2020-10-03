class Airport
  CAPACITY = 10
  attr_reader :planes, :sky

  def initialize
    @planes = []
    @sky = Sky.new
  end

  def land(plane)
    raise "Airport is full." if self.full?
    raise "The plane cannot land as it's not in the air." unless plane.flying?
    raise "The sky is too stormy to land." if @sky.stormy?
    plane.land(self)
    @planes.push(plane)
  end

  def takeoff(plane)
    raise "The sky is too stormy to fly." if @sky.stormy?
    raise "The plane couldn't take off because it is not at the airport." unless self.is_holding?(plane)
    plane.takeoff
    @planes.delete(plane)
  end

  def full?
    @planes.length == CAPACITY
  end

  def is_holding?(plane)
    @planes.include?(plane)
  end
end
