require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :landed_planes, :weather  #allows reading

  def initialize
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
    true if @landed_planes.count >= 5
  end

end
