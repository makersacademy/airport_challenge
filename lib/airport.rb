class Airport
  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity = 75)
    @planes = []
    @capacity = capacity
  end

  def add_plane(plane)
    raise "Airport full" if full?
    @planes << plane
  end

  def remove_plane(plane)
    @planes.delete(plane)
    "#{plane} has left"
  end

  def plane_at_airport?(plane)
    self.planes.include?(plane) ? true : false
  end

  private 
  
  def full?
    @planes.count >= @capacity
  end

end