class Airport
  attr_reader :capacity
  attr_reader :planes

  def initialize
    @capacity = 20
    @planes = []
  end

  def land_plane(plane)
    fail 'Airport Full' if @planes.count >= @capacity
    plane.land!
    @planes << plane
    # returns nil to confirm run
    nil
  end

  # at the moment this just takes the last item out of the array and returns it
  def plane_take_off
    fail 'Airport Empty' if @planes.empty?
    @planes.pop
  end
end

# perhaps at some point do a checker function, which iterates over all the
# planes and checks if they are landed, throwing an error if they're flying/not
# landed
