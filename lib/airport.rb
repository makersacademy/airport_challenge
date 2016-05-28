class Airport
  DEFAULT_CAPACITY = 20
  ERROR_FULL = "Airport is full. Please circle the airport awkwardly."
  ERROR_NO_PLANE = "That plane doesn't exist!"
  
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane)
    fail ERROR_FULL if @planes.length >= @capacity
    @planes << plane
  end

  def take_off(plane)
    fail ERROR_NO_PLANE unless @planes.include?(plane)
    @planes.delete(plane)
  end

end
