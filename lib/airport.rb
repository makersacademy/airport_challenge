class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :hangar
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def instruct_landing(plane)
    raise "Hangar capacity at maximum, please continue to circle" if full?
    hangar << plane
    plane.land
  end

  def instruct_take_off(plane)
    plane.take_off
  end

  private

  def full?
    landed_planes_total >= @capacity
  end

  def landed_planes_total
    hangar.length
  end
end
