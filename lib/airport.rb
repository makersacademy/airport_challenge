require_relative 'plane'

class Airport

  attr_reader :grounded_planes, :capacity

  MAXIMUM_CAPACITY = 100

  def initialize(capacity = MAXIMUM_CAPACITY)
    @grounded_planes = []
    @capacity = capacity
  end

  def airport_is_full
    raise "The airport is full, you cannot land here" if full?
  end

  def land(plane)
    airport_is_full
    @plane = plane
    @grounded_planes << plane
    @plane
  end

  def takeoff(plane)
    @plane = plane
  end

  def confirm_takeoff(plane)
    plane_no  = @grounded_planes.index(plane)
    @grounded_planes.delete_at(plane_no)
    @grounded_planes
  end

  def full?
    true if @grounded_planes.length >= @capacity
  end

end
