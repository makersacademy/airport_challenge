class Airport

  def initialize
    @planes = []
  end

  attr_reader :planes

  def land_plane(plane)
    record_landing(plane)
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

  def record_landing(plane)
    plane.flying = false
  end

end
