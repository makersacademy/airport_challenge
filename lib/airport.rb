class Airport
  def initialize
    @planes_in = []
    @capacity = 20
  end

  def land(plane)
    @planes_in << plane
  end

  def take_off(plane)
    @planes_in.delete(plane)
    return @planes_in
  end
end
