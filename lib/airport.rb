class Airport
  attr_accessor :hangar

  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def full?
    @hangar.length >= @capacity
  end
end
