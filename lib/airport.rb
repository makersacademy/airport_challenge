require_relative './exceptions'
require_relative './weather'

class Airport
  include Weather
  attr_reader :planes

  def initialize
    @planes = []
  end

  def receive_plane(plane)
    @planes << plane
  end

  def release_plane(plane)
    @planes.delete(plane)
  end
end
