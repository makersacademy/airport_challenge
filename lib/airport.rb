class Airport

  attr_reader :planes, :capacity

  def initialize (capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def full?
    @planes.count == capacity
  end
end
