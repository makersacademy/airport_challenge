class Airport

DEFAULT_CAPACITY = 20

  attr_reader :plane

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Airport is full!' if @planes.count == DEFAULT_CAPACITY
    @planes << plane
    plane
  end

  def take_off
    fail 'There are no planes!' if @planes.empty?
    @planes.pop
  end

end
