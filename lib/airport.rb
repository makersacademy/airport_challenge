class Airport
  attr_reader :planes, :capacity

  def initialize
    @planes = []
    @capacity = 20
  end
  
  def land(plane)
    raise "Airport full" if @planes.length >= @capacity
    @planes << plane
  end

  def take_off
    @planes.pop
  end

  def in?(plane)
    @planes.include?(plane)
  end
end
