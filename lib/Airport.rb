
class Airport
  attr_reader :planes, :capacity
  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def land(plane, airborne = true)
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


  def stock_planes(n = @capacity)
     n.times { @planes << Plane.new }
     "#{n} new plane#{"s" if n > 1} have arrived at the airport"
  end


end
