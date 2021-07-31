class Airport
  DEFAULT_CAPAPCITY = 1

  attr_reader :planes
  def initialize(capacity = DEFAULT_CAPAPCITY)
    @planes = []
    @capacity = capacity
  end

  def land_airplane(plane)
    fail "airport full" if full?

    planes << plane
  end

  def takeoff_airplane(plane)
    planes.delete(plane)
    puts "plane no longer at airport"
  end

  private 

  def full?
    planes.count >= @capacity
  end
end
