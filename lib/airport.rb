class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    raise 'Cannot take off in stormy weather' if Weather.stormy?
    @planes.delete(plane)
  end
end
