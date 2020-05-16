class Airport

  attr_accessor :capacity, :planes

  def initialize(cap = DEFAULT_CAPACITY)
    @planes = []
    @capacity = cap
  end

  DEFAULT_CAPACITY = 100

  def at_capacity?
    @planes.length == DEFAULT_CAPACITY
  end

end
