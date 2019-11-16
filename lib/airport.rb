class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane, is_stormy)
    fail "The weather is stormy" if is_stormy
    fail "The airport is full" if full?

    @planes.push(plane).last
  end

  def take_off(is_stormy)
    fail "The weather is stormy" if is_stormy
    fail "The airport is empty" if empty?

    @planes.pop
  end

  private

  attr_reader :planes

  def full?
    @planes.count == @capacity
  end

  def empty?
    @planes.empty?
  end

end
