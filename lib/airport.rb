class Airport

  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :planes

  def initialize(number = DEFAULT_CAPACITY)
    @capacity = number
    @planes = []
  end

  def full?
    fail "full" if @planes.count >= @capacity
  end
end
