require_relative 'plane'

class Airport
  attr_reader :planes
  def release_plane
    fail 'No planes available' unless @plane
    @plane
  end
  def land(plane)
    fail 'Airport full' if @plane
    @plane = plane
  end
end