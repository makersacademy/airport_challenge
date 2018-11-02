require_relative 'plane'

class Airport
  attr_reader :plane

  def land_plane(plane)
    fail "Airport full" if @plane
    @plane = plane
  end

  def take_off
    @plane
  end
end
