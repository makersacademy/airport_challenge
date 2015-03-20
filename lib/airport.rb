require_relative 'plane'

class Airport
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

  def plane_take_off(plane)
    fail 'Airport Empty' if @planes.empty?
    # The below is a bit ugly still
    plane1 = @planes.delete(plane)
    plane1.take_off!
    plane1
  end
end
