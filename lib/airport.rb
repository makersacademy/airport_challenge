#Airport <-- allow_takeoff --> an Aeroplane
require_relative "aeroplane"

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  #edit below later
  def allow_takeoff
    fail "Too stormy to allow take off" if @planes.empty?
    @planes.pop
  end

  def land(plane)
    fail "Airport too full to allow the plane to land" if @planes.count >= 5
    @planes << plane
  end

end
