class Airport

  DEFAULT_CAPACITY = 5

  attr_accessor :hangar, :storm
  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @storm = false
  end

  def full?
    @hangar.length >= @capacity
  end

  def stormy?
    @storm
  end
end