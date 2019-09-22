class Airport

  attr_reader :planes, :weather, :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @random = rand(11) < 9 ? sunny : stormy
    @capacity = capacity
  end

  def sunny
    @weather = "sunny"
  end

  def stormy
    @weather = "stormy"
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
