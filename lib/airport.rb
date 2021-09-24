class Airport

  attr_reader :CAPACITY

  def initialize(capacity = 20)
    @CAPACITY = capacity
    @planes = []
  end

  def get_planes
    @planes
  end

  def add_plane(plane)
    @planes << plane
    "Plane added to hangar!"
  end

  def remove_plane(plane)
    plane = @planes.delete(plane)
    "Plane removed from hangar!"
  end

  def full?
    @planes.length == @CAPACITY
  end

end