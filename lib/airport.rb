class Airport
  attr_reader :planes

  DEFAULT_CAPACITY = 50

  def initialize
    @planes = []
  end

  def land(plane)
    raise 'Cannot land, Airport at maximum capacity' if planes.length >= DEFAULT_CAPACITY
    @planes.push(plane)
    plane.landed = true
  end

  def take_off
    raise 'Airport empty' if @planes.empty?
    plane = @planes.shift
    plane.landed = false
    print "#{plane} has taken off"
    plane
  end
end