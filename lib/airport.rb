class Airport

  attr_reader :planes, :capacity, :stormy
  DEFAULT_CAPACITY = 30
  DEFAULT_WEATHER = false

  def initialize(capacity = DEFAULT_CAPACITY, stormy = DEFAULT_WEATHER)
    @planes = []
    @capacity = capacity
    @stormy = stormy
  end

  def full?
    @planes.length >= DEFAULT_CAPACITY
  end

  def airport_empty?
    @planes.empty?
  end

  def register_landing(plane)
    @planes << plane
  end
end
