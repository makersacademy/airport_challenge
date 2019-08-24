class Airport
  class PlaneNotFound < RuntimeError
  end

  class AirportFull < RuntimeError
  end

  class PlaneAlreadyLanded < RuntimeError
  end

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = Set.new
  end

  def land(plane)
    raise PlaneAlreadyLanded if landed?(plane)
    raise AirportFull if at_capacity?

    plane.is_landed = true
    @planes.add(plane)
  end

  def at_capacity?
    @planes.count == @capacity
  end

  def landed?(plane)
    @planes.include?(plane)
  end

  def take_off(plane)
    raise PlaneNotFound unless landed?(plane)

    plane.is_landed = false
    @planes.delete(plane)
  end
end