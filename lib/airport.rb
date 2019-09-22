class Airport

  # attr_reader :planes, :weather
  attr_accessor :planes, :weather, :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @random = rand(11)
    @weather = @random < 9 ? "sunny" : "stormy"
    @capacity = capacity
  end

  def full?
    planes.count >= capacity
  end

  def add_plane(plane)
    planes << plane
  end

  def remove_plane(plane)
    planes.delete(plane)
  end

end
