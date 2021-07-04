class Airport
  attr_reader :hangar
  attr_accessor :capacity
  CAPACITY = 2000

  def initialize(capacity = CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def full?
    (@hangar.length >= capacity) == true
  end
end
