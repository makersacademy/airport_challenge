class Airport

  attr_reader :capacity

  def initialize(capacity=20)
    @capacity = capacity
    @planes = 0
  end

  def full?
    planes >= capacity
  end

end
