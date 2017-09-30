class Airport

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity
  attr_reader :plane

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport is full!' if @planes.count >= @capacity
    @planes << plane
    plane
  end

  def take_off
    fail 'There are no planes!' if @planes.empty?
    @planes.pop
  end

end
