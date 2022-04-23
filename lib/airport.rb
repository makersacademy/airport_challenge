class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise 'airport full' unless planes.empty?
    planes << plane
  end

  def take_off(plane)
    planes.delete(plane)
  end
end
