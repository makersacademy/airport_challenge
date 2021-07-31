# require_relative 'plane'
class Airport
  DEFAULT_CAPAPCITY = 2

  attr_reader :planes
  def initialize(capacity = DEFAULT_CAPAPCITY)
    @planes = []
    @capacity = capacity
  end

  def land_airplane(plane)
    fail "airport full" if full?
    fail "plane already landed" unless plane.flying
    plane.flying?(false)
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
