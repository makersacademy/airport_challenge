class Airport
  def initialize(maximum)
    @maximum = maximum
    @planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport full' if full
    @planes << plane
  end
  def take_off(plane)
  end
end

private
def full
  @planes.length >= @maximum
end
  
  