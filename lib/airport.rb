require_relative "plane"

class Airport

  attr_reader :plane

  def intilialize(plane)
    @plane = plane
  end

  def receive_plane(plane)
    plane
  end

  def dispatch_plane(plane)
    plane
  end

end
