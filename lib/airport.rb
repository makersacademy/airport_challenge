require_relative "plane"

class Airport
  attr_reader :plane

  def release_plane
    fail "No planes at the airport to take off" unless @plane
    @plane
  end

  def land(plane)
    @plane = plane
  end

end
