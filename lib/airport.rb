class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes_landed = []
  end

  def land(plane)
    raise "airport full - cannot land plane" if @planes_landed.length >= @capacity
    @planes_landed << plane
  end

  def take_off(plane)
  end
end
