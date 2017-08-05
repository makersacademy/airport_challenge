
class Airport
  attr_reader :planes, :capacity

  $DEFAULT_CAPACITY = 10

  def initialize(capacity = $DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane, airborne = true)
    raise "Airport full" if full?
    raise "Plane not in the air" unless airborne
    @planes << plane
    plane
  end

  def depart(plane)
    @planes.delete(plane)
    "Flight #{plane} has just departed"
  end

  def show_planes
    @planes
  end


  def stock_planes(n = @capacity) # the default is max capacity
     n.times { @planes << Plane.new }
     "#{n} new plane#{"s" if n > 1} have arrived at the airport"
  end

  private

  def full?
    @capacity == @planes.length
  end


end
