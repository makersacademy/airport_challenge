class Airport

  attr_reader :capacity, :planes

  def initialize(capacity = 20)
    @capacity = capacity
    @planes = []
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
    @planes.length == @capacity
  end

end
