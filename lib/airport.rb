class Airport

  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
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
