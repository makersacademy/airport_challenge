class Airport
  def initialize(capacity = 20)
    @planes_in = []
    @capacity = capacity
  end

  def land(plane)
    raise 'no space for landing' if @planes_in.length == @capacity

    raise 'this plane is already in the airport' if @planes_in.include?(plane)

    @planes_in << plane
  end

  def take_off(plane)
    raise 'this plane is not in this airport' if @planes_in.include?(plane) == false

    @planes_in.delete(plane)
    return @planes_in
  end
end
