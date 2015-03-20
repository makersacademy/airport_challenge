class Airport
  def initialize
    @planes = []
  end

  def land_plane plane
    planes << plane
  end

  def take_off_plane
    planes.pop
  end

  def plane_count
    planes.length
  end

  private

  attr_accessor :planes
end
