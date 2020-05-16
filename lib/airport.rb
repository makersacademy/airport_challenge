class Airport
  def initialize
    @planes_in = []
    @capacity = 20
  end

  def land(plane)
    raise 'no space for landing' if @planes_in.length == @capacity

    @planes_in << plane
  end

  def take_off(plane)
    @planes_in.delete(plane)
    return @planes_in
  end
end
