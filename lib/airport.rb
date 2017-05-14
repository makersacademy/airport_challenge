class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 10

  def initialize(n=DEFAULT_CAPACITY)
    @planes = [ ]
    @capacity = n
  end

  def full?
    @planes.count >= @capacity
  end
end
