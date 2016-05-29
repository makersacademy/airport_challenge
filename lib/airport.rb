class Airport

  DEFAULT_CAPACITY = 100

  attr_reader :capacity
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def take_off
  end

  def land(plane)
  end

end