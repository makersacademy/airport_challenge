class Airport
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    if @planes.count < @capacity
      @planes.push(plane)
      p @planes
    else
      raise "airport full!"
    end
  end

  def take_off(plane)
    @planes.delete(plane)
    p @planes
  end

  def planes_here
    @planes
  end
end

class Plane
  def initialize
  end
end

plane1 = Plane.new
airport1 = Airport.new
airport1.land(plane1)
airport1.take_off(plane1)
