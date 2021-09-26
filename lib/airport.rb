class Airport
  DEFAULT_CAPACITY = 10 

  def initialize 
    @landed = []
  end

  def land(plane)
    raise 'Not accepting more planes to land' if full?
    @landed << plane
  end

  def take_off
    @landed.pop
  end

  def full?
    @landed.length >= DEFAULT_CAPACITY
  end
    
end