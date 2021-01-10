class Airport
    attr_reader :planes
    attr_reader :capacity

  def initialize
    @capacity = capacity
    @planes = []
  end

  def land?
    fail "cannot land plane - airport full" if isairportfull
    @planes << plane
  end

  def takeoff?(plane)
  end

  private 

  def isairportfull
    @planes.count >= @capacity
  end

end
