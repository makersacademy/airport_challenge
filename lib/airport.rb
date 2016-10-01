require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def receive_plane(plane)
    @planes << plane
    plane.landed
  end

  def release_plane(plane)
    @planes = @planes.select { |pl| pl != plane }
  end

  def plane_at_airport(plane)
    @planes.include? plane
  end

end
