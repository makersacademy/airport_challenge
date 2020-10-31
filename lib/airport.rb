class Airport
  attr_reader :planes, :capacity, :weather

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Cannot land, Airport at maximum capacity' if full?
    @planes.push(plane)
    plane.landed = true
  end

  def take_off
    raise 'Airport empty' if @planes.empty?
    raise 'Weather conditions unsuitable for take off' if self.weather == 'stormy'
    plane = @planes.shift
    plane.landed = false
    print "#{plane} has taken off"
    plane
  end

  private

  def full?
    @planes.length == @capacity
  end
end