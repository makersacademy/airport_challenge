require_relative './plane.rb'

class Airport
  attr_reader :planes
  attr_reader :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail "Plane already landed" if @flying == false
    fail "No room at aiport" if @planes.length >= @capacity
    fail "Cannot land in stormy weather" if @weather == "stormy"
    @planes << plane
  end

  def take_off
    fail "No planes to take off" if no_landed_planes?
    fail "Cannot fly in stormy weather" if @weather == "stormy"
    @planes.pop
  end

  def no_landed_planes?
    @planes.empty?
  end
end
