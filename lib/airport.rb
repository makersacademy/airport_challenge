require "./lib/plane"

class Airport
  attr_reader :runway

  def initialize
    @runway = []
  end

  def land_plane(plane)
    @runway << plane
  end
end
