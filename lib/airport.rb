class Airport

  DEFAULT_CAPACITY = 100

  attr_reader :planes, :weather

  def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @planes = []
    @weather = rand(5)
  end

  def capacity
    @capacity
  end

  def ok_landing(plane)
    raise "Airport is full" if full?
    @planes << plane #unless (@weather < 2 == true)
  end

  def has_planes?
    !@planes.empty?
  end

  def full?
    @planes.count == capacity
  end

  def ok_takeoff plane
    @planes.delete plane #unless (@weather < 2 == true)
  end

end