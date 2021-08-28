class Airport

  def initialize
    @planes = []
  end

  attr_reader :planes

  def land_plane(plane)
    plane.flying = false
    @planes << plane
  end

  def take_off
    record_departure
    Plane.new true
  end

  private

  def record_departure
    @planes.delete_at(@planes.length - 1)
  end

end
