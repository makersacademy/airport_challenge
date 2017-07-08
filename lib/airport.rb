require_relative "plane"

class Airport

  attr_reader :plane

  def receive_plane(plane)
    @plane = plane
  end

  def dispatch_plane(plane)
    @plane = plane
  end

end
