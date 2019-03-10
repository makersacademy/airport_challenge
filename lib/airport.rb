class Airport
  attr_accessor :capacity
  attr_accessor :landed_planes

  def initialize(capacity = 10)
    @capacity = capacity 
    @landed_planes = []
  end

  def has?(plane)
    @landed_planes.include?(plane)
  end

  def full?
    @landed_planes.count >= @capacity
  end
end
