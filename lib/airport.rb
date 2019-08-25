require_relative "plane"
require_relative "weather"

class Airport
include Weather

  attr_reader :hanger
  def initialize
    @hanger = []
  end

  def receive_plane(plane)
    @hanger << plane
  end

  def release_plane(plane)
    fail 'Weather bad, no fly zone' unless condition?
    @hanger.delete(plane)
  end
end
