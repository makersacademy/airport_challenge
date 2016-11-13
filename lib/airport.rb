#Airport <-- allow_takeoff --> an Aeroplane
require_relative "aeroplane"

class Airport
  attr_reader :plane

  def allow_takeoff
    fail "Too stormy to allow take off" unless @plane
    @plane
  end

  def land(plane)
    fail "Airport too full to allow the plane to land" if @plane
    @plane = plane
  end

end
