class AirField
  def initialize
    @planes = []
  end

  def receive_plane(plane)
    @planes << plane
  end
end
