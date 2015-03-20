class Airport
  attr_reader :capacity
  attr_reader :planes

  def initialize
    @capacity = 1
    @planes = []
  end

  def land_plane(plane)
    fail 'Airport Full' if @planes.count >= @capacity
    # Adds the incoming plane to an array
    @planes << plane
    # Returns the first item in the array, currently for confirmation purposes
    @planes[0]
  end
end
