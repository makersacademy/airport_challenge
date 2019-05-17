class Airport
  attr_reader :planes, :stormy

  def initialize
    @planes = []
    @stormy = false
  end

  def land(plane)
    planes << plane
  end

  def take_off(plane)
    raise 'Planes grounded: stormy weather!' if @stormy == true
    planes.delete(plane)
  end
end