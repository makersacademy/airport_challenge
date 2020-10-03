require_relative 'plane'

CAPACITY_DEFAULT = 20
class Airport

  attr_reader :plane, :capacity

  def initialize(capacity = CAPACITY_DEFAULT)
    @planes_grounded = []
    @capacity = capacity
  end

  def plane_landing(plane)
    fail 'Airport full' if @planes_grounded.count >= 20
    # fail 'Whether conditions do not permit landing' if whether == 20
    @planes_grounded << plane
    @plane = plane
  end

  def airport_full
  end

  def landed(plane)
    @plane = plane
  end

end
