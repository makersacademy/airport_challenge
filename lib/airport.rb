class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "plane already in airport" if present?(plane)
    add_plane(plane)
  end

  def take_off(plane)
    fail "plane not in airport" unless present?(plane)
    remove_plane(plane)
  end

  private

  def present?(plane)
    @planes.include?(plane)
  end

  def remove_plane(plane)
    @planes.delete(plane)
  end

  def add_plane(plane)
    @planes << plane
  end
end
