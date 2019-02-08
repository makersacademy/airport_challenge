class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes.push(plane)
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  def has_plane?(plane)
    @planes.include?(plane)
  end
end
