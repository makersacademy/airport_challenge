require_relative 'plane'
require_relative 'weather'

CAPACITY_DEFAULT = 20
class Airport
  include Weather

  attr_reader :plane, :capacity, :planes_grounded

  def initialize(capacity = CAPACITY_DEFAULT)
    @planes_grounded = []
    @capacity = capacity
    @plane = plane
  end

  def plane_landing(plane)
    raise StandardError.new 'Airport full' if @planes_grounded.length >= 20

    @planes_grounded << plane
    @plane = plane
    # fail 'Whether conditions do not permit landing' if whether == 20
  end

  def add_landed_plane(plane)
    @planes_grounded << plane
    @plane = plane
  end

end
