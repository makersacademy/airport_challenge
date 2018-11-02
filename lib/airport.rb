class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def release_plane
    @planes.pop
  end

  def list_planes
    if @planes.length.zero?
      0
    else
      @planes
    end
  end
end
