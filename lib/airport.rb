class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Cannot land plane: airport full" if @planes.length >= @capacity
    
    @planes << plane
  end

  def take_off(plane)

  end

end
