class Airport
  attr_reader :planes, :capacity

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
    raise 'Weather conditions unacceptable for take off' if weather == 'stormy'
    plane = @planes.shift
    plane.landed = false
    print "#{plane} has taken off"
    plane
  end

  def weather
    sunnies = Array.new(19) { 'sunny' }
    stormies = Array.new(1) { 'stormy' }
    samples = sunnies.concat(stormies).shuffle
    randIndex = rand(0...samples.length)
    samples[randIndex]
  end

  private

  def full?
    @planes.length == @capacity
  end
end