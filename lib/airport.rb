class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    raise 'Plane cannot land as airport is full' if @planes.count == 10

    @planes << plane
  end
end
