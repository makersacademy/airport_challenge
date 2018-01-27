class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Too stormy to land" if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise "Too stormy to take off" if stormy?
    raise "Plane not in this airport" unless @planes.include?(plane)
    @planes.reject { plane }
  end

  private

  def stormy?
    rand(2).zero?
  end

end
