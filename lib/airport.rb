class Airport
  def initialize
    @planes = []
  end

  attr_reader :planes

  def accept plane
    raise "Plane is already at an airport" unless plane.flying?
    plane.land
    store_plane plane
  end

  private
  def store_plane plane
    @planes << plane
  end
end