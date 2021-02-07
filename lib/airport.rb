class Airport
  attr_reader :capacity, :planes
  DEFAULT_CAPACITY = 10
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def stormy?
    return false if rand(1..10).between?(1, 9)

    true
  end

  def full?
    return true if @planes.length == @capacity

    false
  end

end
