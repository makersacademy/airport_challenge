require_relative "plane"

class Airport

  attr_reader :plane

  def receive_plane(plane)
    @plane = plane
  end

=begin
  def dispatch_plane

  end
=end

end
