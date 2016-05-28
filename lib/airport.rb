class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    fail ERROR_FULL if @planes.length >= DEFAULT_CAPACITY
    @planes << plane
  end

  def take_off(plane)
    fail ERROR_NO_PLANE unless @planes.include?(plane)
    @planes.delete(plane)
  end

  private
    DEFAULT_CAPACITY = 20
    ERROR_FULL = "Airport is full. Please circle the airport awkwardly."
    ERROR_NO_PLANE = "That plane doesn't exist!"

end
