class Airport

  DEFAULT_CAPACITY = 5

  attr_reader :name, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @name = ""
    @capacity = capacity
  end

  def stormy?
    rand(10) <= 2
  end

  def full?
    capacity == 5
  end

end
