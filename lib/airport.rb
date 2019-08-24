class Airport
  class PlaneNotFound < RuntimeError
  end

  class AirportFull < RuntimeError
  end

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = Set.new
  end

  def land(plane)
    raise AirportFull if at_capacity?

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

    @planes.delete(plane)
  end
end