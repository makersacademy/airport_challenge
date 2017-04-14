class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :planes, :capacity

  def initialize(default = DEFAULT_CAPACITY)
    @planes = []
    @capacity = default
  end

  def land(plane)
    fail "The airport is full" if full?
    @planes << plane
  end

  def take_off
    fail "There are no planes" if @planes.empty?
    @planes
  end

  private

  def full?
    @planes.count >= @capacity ? true : false
  end

end
