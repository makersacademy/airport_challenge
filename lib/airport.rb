class Airport

  DEFAULT_CAPACITY = 5

  attr_reader :name, :capacity
  attr_accessor :parked

  def initialize(name, capacity = DEFAULT_CAPACITY)
    @name = name
    @capacity = capacity
    @parked = 0
  end

  def full?
    @parked >= capacity
  end

end
