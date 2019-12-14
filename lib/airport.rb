class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes_landed = 0
  end

  def land(plane)
    raise "airport full - cannot land plane" if @planes_landed >= @capacity
    @planes_landed += 1  
  end

  def take_off(plane)
  end
end
