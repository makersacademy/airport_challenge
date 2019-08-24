require_relative "plane"

class Airport
  attr_reader :hanger
  def initialize
    @hanger = []
  end

  def receive_plane(plane)
    @hanger << plane
  end

  def release_plane(plane)
    @hanger.delete(plane)
  end
end
