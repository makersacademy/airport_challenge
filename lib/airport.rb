require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 5

  attr_accessor :capacity  #allows reading
  attr_reader :landed_planes, :weather

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
    @weather = Weather.new
  end

  def land(plane)
    if @weather.stormy == true
      fail "Mayday, MAYDAY... can't land in stormy weather"
    else
      @landed_planes << plane
      plane.landed = true
    end
    fail "No space" if full?
  end

  def takeoff(plane)
    plane.landed = false
    @landed_planes.delete(plane)
  end

  private
  def full?
    true if @landed_planes.count >= capacity
  end

end
