class Airport
  DEFAULT_CAPAPCITY = 2

  attr_reader :planes
  def initialize(capacity = DEFAULT_CAPAPCITY)
    @weather = Weather.new.stormy?
    @planes = []
    @capacity = capacity
  end

  def land_airplane(plane)
    fail "airport full" if full?

    fail "plane already landed" unless plane.flying

    fail "weather is stormy" if stormy?

    plane.flying?(false)
    planes << plane
  end

  def takeoff_airplane(plane)
    fail "plane not at airport" unless planes.include?(plane)
    
    plane.flying?(true)
    planes.delete(plane)
    puts "plane no longer at airport"
  end

  def stormy?
    @weather == true
  end

  private 

  def full?
    planes.count >= @capacity 
  end
end
