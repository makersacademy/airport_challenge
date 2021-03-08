class Airport
  attr_accessor :name, :capacity
  DEFAULT_CAPACITY = 60

  def initialize(name, capacity = DEFAULT_CAPACITY)
    @name = name
    @capacity = capacity
    @planes = []
  end

  def release_plane(plane)
    @planes.pop if plane.takeoff
  end

  def receive_plane(plane)
    @planes.push(plane) if plane.land
    @planes.last
  end

  def full?
    @planes.count >= @capacity
  end

end
