class Airport
  CAPACITY = 10
  attr_reader :planes, :sky

  def initialize
    @planes = []
    @sky = Sky.new
  end

  def land(plane)
    raise "Airport is full." if full?
    raise "The plane cannot land as it's not in the air." unless plane.flying?
    raise "The sky is too stormy to land." if @sky.stormy?

    plane.land(self)
    @planes.push(plane)
  end

  def takeoff(plane)
    raise "The sky is too stormy to fly." if @sky.stormy?
    raise "Plane not at airport." unless holding?(plane)

    plane.takeoff
    @planes.delete(plane)
  end

  def full?
    @planes.length == CAPACITY
  end

  def holding?(plane)
    @planes.include?(plane)
  end
end
