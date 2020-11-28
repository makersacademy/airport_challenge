class Airport

  DEFAULT_CAPACITY = 5

  attr_accessor :hangar
  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def full?
    @hangar.length >= @capacity
  end

end